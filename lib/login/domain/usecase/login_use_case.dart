import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:mobile_foundation_headless_flutter/core/domain/data_signer.dart';
import 'package:nanodart/nanodart.dart';
import 'package:pointycastle/asn1.dart';
import 'package:pointycastle/export.dart';

import '../../../core/domain/result.dart';
import '../../../core/domain/storage_service.dart';
import '../../../core/domain/use_case_config.dart';
import '../entity/challenge_entity.dart';
import '../login_errors.dart';
import '../repo/login_repository.dart';

class LoginUseCase {
  final LoginRepository repo;
  final StorageService storageService;
  final UseCaseConfig config;

  LoginUseCase(
    this.repo,
    this.storageService,
      this.config,
  );



  Future<Result<Empty, LoginErrors>> call(String username, String password) async {
    try {
      final Result<List<ChallengeEntity>, LoginErrors> challengesResult =await repo.getChallenges(config.realm, username, password, config.grantType, config.clientId);
      if (challengesResult is ResultError<List<ChallengeEntity>, LoginErrors>) {
        return ResultError((challengesResult).error);
      }
      AsymmetricKeyPair<ECPublicKey, ECPrivateKey> pair =
          generateRSAkeyPair(exampleSecureRandom());
      ECPublicKey publicKey = pair.publicKey;
      ECPrivateKey privateKey = pair.privateKey;
      var publicKeyAsBase64 = encodeEcPublicKeyToPem(publicKey);
      var privateKeyAsBase64 = encodeEcPrivateKeyToPem(privateKey);
      var submitChallengeResult = await _submitChallenge(
        (challengesResult as Success<List<ChallengeEntity>, LoginErrors>),
        username,
        password,
        publicKeyAsBase64,
      );

      if (submitChallengeResult
          is ResultError<List<ChallengeEntity>, LoginErrors>) {
        return ResultError((submitChallengeResult).error);
      }
      var submitChallengeSuccess =
          submitChallengeResult as Success<List<ChallengeEntity>, LoginErrors>;
      var deviceId = submitChallengeSuccess.data[0].deviceId!;
      var tokenResult = await _submitSignature(
        privateKey,
        submitChallengeSuccess,
        username,
        password,
      );

      if (tokenResult is ResultError<String, LoginErrors>) {
        return ResultError((tokenResult).error);
      }
      var xRegistrationToken = (tokenResult as Success<String, LoginErrors>);
      storageService.writeDeviceId(deviceId);
      storageService.writeRegisterToken(xRegistrationToken.data);
      storageService.writeUserName(username);
      storageService.writePassword(password);
      storageService.writePrivateKey(privateKeyAsBase64);
      storageService.writePublicKey(publicKeyAsBase64);
      return Success(Empty.instance);
    } catch (e, stacktrace) {
      return ResultError(UnExpectedError());
    }
  }

  Future<Result<List<ChallengeEntity>, LoginErrors>> _submitChallenge(
      Success<List<ChallengeEntity>, LoginErrors> challenges,
      String username,
      String password,
      String publicKeyAsBase64) async {
    return await repo.submitChallenge(config.realm, username, password, config.grantType,
        config.clientId, publicKeyAsBase64, config.deviceKeyAlgorithm);
  }

  Future<Result<String, LoginErrors>> _submitSignature(
    ECPrivateKey privateKey,
    Success<List<ChallengeEntity>, LoginErrors> challengesResult,
    String username,
    String password,
  ) async {
    var data = challengesResult.data[0].nonce!;
    var deviceSignature = DataSigner()(privateKey, data);
    var deviceId = challengesResult.data[0].deviceId!;
    var nonce = challengesResult.data[0].nonce!;

    var result = await repo.submitSignature(
      config.realm,
      username,
      password,
      config.grantType,
      config.clientId,
      deviceSignature,
      config.deviceSignatureAlgorithm,
      deviceId,
      nonce,
    );
    return result;
  }
  AsymmetricKeyPair<ECPublicKey, ECPrivateKey> generateRSAkeyPair(
      SecureRandom secureRandom) {
    // Create an RSA key generator and initialize it
    // final keyGen = KeyGenerator('RSA'); // Get using registry
    final keyGen = ECKeyGenerator();
    keyGen.init(ParametersWithRandom(
        ECKeyGeneratorParameters(ECCurve_secp256r1()), exampleSecureRandom()));
    // Use the generator
    final pair = keyGen.generateKeyPair();
    // Cast the generated key pair into the RSA key types
    final myPublic = pair.publicKey as ECPublicKey;
    final myPrivate = pair.privateKey as ECPrivateKey;
    return AsymmetricKeyPair<ECPublicKey, ECPrivateKey>(myPublic, myPrivate);
  }

  SecureRandom exampleSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
    return secureRandom;
  }

  String toBase64(BigInt data) {
    return base64UrlEncode(NanoHelpers.bigIntToBytes(data));
  }

  static String encodeEcPublicKeyToPem(ECPublicKey publicKey) {
    var outer = ASN1Sequence();
    var algorithm = ASN1Sequence();
    algorithm.add(ASN1ObjectIdentifier.fromName('ecPublicKey'));
    algorithm.add(secp256r1());
    Uint8List encodedBytes = publicKey.Q!.getEncoded(false);

    var subjectPublicKey = ASN1BitString(stringValues: encodedBytes);

    outer.add(algorithm);
    outer.add(subjectPublicKey);
    var dataBase64 = base64UrlEncode(outer.encode());
    return dataBase64;
  }

  static ASN1ObjectIdentifier secp256r1() {
    var asn1objectIdentifier = ASN1ObjectIdentifier([1, 2, 840, 10045, 3, 1, 7],
        tag: ASN1Tags.OBJECT_IDENTIFIER);
    asn1objectIdentifier.readableName = "secp256r1";
    return asn1objectIdentifier;
  }

  static String encodeEcPrivateKeyToPem(ECPrivateKey ecPrivateKey) {
    var outer = ASN1Sequence()..add(ASN1Integer(BigInt.from(0)));
    ////
    var choice = ASN1Sequence()
      ..add(ASN1ObjectIdentifier.fromName("ecPublicKey"))
      ..add(secp256r1());
    /////
    outer.add(choice);

    var asn1sequence = ASN1Sequence()
      ..add(ASN1Integer(BigInt.from(1)))
      ..add(ASN1OctetString(octets: i2osp(ecPrivateKey.d!)));
    final newOctetString = ASN1OctetString(octets: asn1sequence.encode());
    outer.add(newOctetString);

    var dataBase64 = base64UrlEncode(outer.encode());
    return dataBase64;
  }

  static Uint8List i2osp(BigInt number,
      {int? outLen, Endian endian = Endian.big}) {
    var size = (number.bitLength + 7) >> 3;
    if (outLen == null) {
      outLen = size;
    } else if (outLen < size) {
      throw Exception('Number too large');
    }
    final result = Uint8List(outLen);
    var pos = endian == Endian.big ? outLen - 1 : 0;
    for (var i = 0; i < size; i++) {
      result[pos] = (number & BigInt.from(0xff)).toInt();
      if (endian == Endian.big) {
        pos -= 1;
      } else {
        pos += 1;
      }
      number = number >> 8;
    }
    return result;
  }
}

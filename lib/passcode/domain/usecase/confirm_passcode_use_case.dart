import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/use_case_config.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/passcode_errors.dart'
    as pass_code_error;
import 'package:mobile_foundation_headless_flutter/passcode/domain/repo/passcode_repository.dart';
import '../../../core/domain/data_signer.dart';
import '../../../core/domain/storage_service.dart';
import '../../../login/domain/entity/challenge_entity.dart';
import '../../../login/domain/login_errors.dart';
import '../../../login/domain/repo/login_repository.dart';
import 'dart:convert';

class ConfirmPasscodeUseCase {
  final PasscodeRepository repo;
  final LoginRepository loginRepository;
  final StorageService storageService;
  final UseCaseConfig config;

  ConfirmPasscodeUseCase(
    this.repo,
    this.loginRepository,
    this.storageService,
    this.config,
  );

  Future<Result<Empty, pass_code_error.PasscodeErrors>> call(
      String passcode) async {
    var previousPasscode = await storageService.readPasscode();
    var deviceId = await storageService.readDeviceId();
    var registrationToken = await storageService.readRegisterToken();
    var username = await storageService.readUserName();
    var password = await storageService.readPassword();
    var publicKeyAsBase64 = await storageService.readPublicKey();
    var privateKeyAsBase64 = await storageService.readPrivateKey();
    if (previousPasscode == null ||
        deviceId == null ||
        registrationToken == null ||
        username == null ||
        password == null ||
        publicKeyAsBase64 == null ||
        privateKeyAsBase64 == null) {
      if (kDebugMode) {
        print(">>>>$previousPasscode");
        print(">>>>$deviceId");
        print(">>>>$registrationToken");
        print(">>>>$username");
        print(">>>>$password");
        print(">>>>$publicKeyAsBase64");
        print(">>>>$privateKeyAsBase64");
      }

      return ResultError(pass_code_error.DataNotFound());
    }
    if (previousPasscode != passcode) {
      return ResultError(pass_code_error.PasscodeDoNotMatch());
    }
    var submitPasscodeResult = await submitPasscode(
        deviceId, registrationToken, passcode, username, privateKeyAsBase64);
    if (submitPasscodeResult
        is ResultError<Empty, pass_code_error.PasscodeErrors>) {
      return ResultError(submitPasscodeResult.error);
    }
    var authenticateResult = await loginRepository.authenticate(
        config.realm,
        username,
        password,
        config.grantType,
        config.clientId,
        config.acrValues,
        deviceId);
    if (authenticateResult is ResultError<List<ChallengeEntity>, LoginErrors>) {
      return ResultError(pass_code_error.UnExpectedError());
    }
    var authenticateSuccess =
        (authenticateResult as Success<List<ChallengeEntity>, LoginErrors>);
    var nonce = authenticateSuccess.data[0].nonce!;
    var prkKeyAsBytes = base64Decode(privateKeyAsBase64);
    ECPrivateKey privateKey =
        CryptoUtils.ecPrivateKeyFromDerBytes(prkKeyAsBytes, pkcs8: true);

    var deviceSignature = DataSigner()(privateKey, nonce);
    var tokenResult = await loginRepository.getAccessToken(
      realm: config.realm,
      username: username,
      password: password,
      grantType: config.grantType,
      clientId: config.clientId,
      deviceSignature: deviceSignature,
      deviceSignatureAlgorithm: config.deviceSignatureAlgorithm,
      deviceId: deviceId,
      nonce: nonce,
      acrValues: config.acrValues,
    );
    if (tokenResult is ResultError) {
      return ResultError(pass_code_error.UnExpectedError());
    }
    await storageService.clear();
    var tokenSuccess = (tokenResult as Success<TokenDTO, LoginErrors>).data;
    await storageService.writeToken(tokenSuccess);
    return Success(Empty());
  }

  Future<Result<Empty, pass_code_error.PasscodeErrors>> submitPasscode(
    String deviceId,
    String registrationToken,
    String passcode,
    String username,
    String privateKeyAsBase64,
  ) async {
    return await repo.setPasscode(
        config.realm,
        deviceId,
        registrationToken,
        SetPassCodeRequest(
            passcode: passcode,
            username: username,
            encryptedPrivateKey: privateKeyAsBase64));
  }
}

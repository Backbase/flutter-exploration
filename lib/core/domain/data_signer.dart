import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:pointycastle/asn1/primitives/asn1_integer.dart';
import 'package:pointycastle/asn1/primitives/asn1_sequence.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:pointycastle/signers/ecdsa_signer.dart';

class DataSigner {
  String call(ECPrivateKey privateKey, String data) {
    final signerParams = ParametersWithRandom(PrivateKeyParameter<ECPrivateKey>(privateKey), _exampleSecureRandom());
    final signer = ECDSASigner(SHA256Digest());
    signer.init(true, signerParams);
    final ecSignature = signer.generateSignature(Uint8List.fromList(data.codeUnits))as ECSignature;
    final encoded = ASN1Sequence(elements: [ASN1Integer(ecSignature.r), ASN1Integer(ecSignature.s)]).encode();
    var deviceSignature = base64UrlEncode(encoded);
    return deviceSignature;
  }
  SecureRandom _exampleSecureRandom() {
    var secureRandom = FortunaRandom();
    var random = Random.secure();
    List<int> seeds = [];
    for (int i = 0; i < 32; i++) {
      seeds.add(random.nextInt(255));
    }
    secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
    return secureRandom;
  }
}

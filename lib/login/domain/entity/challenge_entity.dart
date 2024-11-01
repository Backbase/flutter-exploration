import 'dart:convert';

class ChallengeEntity {
  final String challengeType;
  final String? nonce;
  final String? deviceId;

  ChallengeEntity(this.challengeType, this.nonce, this.deviceId);

  @override
  String toString() {
    Map<String, dynamic> jsonData = {
      "challengeType": challengeType,
      "nonce": nonce,
      "deviceId": deviceId,
    };
    return const JsonEncoder().convert(jsonData);
  }
}

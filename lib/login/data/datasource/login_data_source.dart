import 'package:generated_services/api.dart';

abstract class LoginDataSource {
  Future<ChallengesDTO> getChallenges(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
  );

  Future<ChallengesDTO> submitChallenge(
      String realm,
      String username,
      String password,
      String grantType,
      String clientId,
      String deviceKey,
      String deviceKeyAlgorithm);

  Future<ChallengesDTO> authenticate(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
    String acrValues,
    String deviceId,
  );

  Future<TokenDTO> getAccessToken({
    required String realm,
    required String username,
    required String password,
    required String grantType,
    required String clientId,
    required  String deviceSignature,
    required  String deviceSignatureAlgorithm,
    required  String deviceId,
    required  String nonce,
    required String acrValues,
  });

  Future<String> submitSignature(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
    String deviceSignature,
    String deviceSignatureAlgorithm,
    String deviceId,
    String nonce,
  );
}

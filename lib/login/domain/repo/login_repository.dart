import 'package:generated_services/api.dart';

import '../../../core/domain/result.dart';
import '../entity/challenge_entity.dart';
import '../login_errors.dart';

abstract class LoginRepository {
  Future<Result<List<ChallengeEntity>, LoginErrors>> getChallenges(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
  );

  Future<Result<List<ChallengeEntity>, LoginErrors>> submitChallenge(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
    String deviceKey,
    String deviceKeyAlgorithm,
  );

  Future<Result<String, LoginErrors>> submitSignature(
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
  Future<Result<List<ChallengeEntity>, LoginErrors>> authenticate(
      String realm,
      String username,
      String password,
      String grantType,
      String clientId,
      String acrValues,
      String deviceId,
      );
  Future<Result<TokenDTO,LoginErrors>>  getAccessToken({
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
}

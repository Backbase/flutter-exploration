import 'dart:io';

import 'package:generated_services/api.dart';

import '../login_data_source.dart';

class LoginRemoteDataSource implements LoginDataSource {
  final TokenApi api;

  LoginRemoteDataSource(this.api);

  @override
  Future<ChallengesDTO> getChallenges(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
  ) async {
    final response = await api.tokenWithHttpInfo(
      realm,
      username,
      password,
      grantType,
      clientId,
    );
    if (response.statusCode != HttpStatus.unauthorized) {
      throw ApiException(response.statusCode, response.body);
    }
    return await api.apiClient.deserializeAsync(response.body, "ChallengesDTO")
        as ChallengesDTO;
  }

  @override
  Future<ChallengesDTO> submitChallenge(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
    String deviceKey,
    String deviceKeyAlgorithm,
  ) async {
    final response = await api.tokenWithHttpInfo(
      realm,
      username,
      password,
      grantType,
      clientId,
      deviceKey: deviceKey,
      deviceKeyAlgorithm: deviceKeyAlgorithm,
    );
    if (response.statusCode != HttpStatus.unauthorized) {
      throw ApiException(response.statusCode, response.body);
    }
    return await api.apiClient.deserializeAsync(response.body, "ChallengesDTO")
        as ChallengesDTO;
  }

  @override
  Future<TokenDTO> getAccessToken({
    required String realm,
    required String username,
    required String password,
    required String grantType,
    required String clientId,
    required String deviceSignature,
    required String deviceSignatureAlgorithm,
    required String deviceId,
    required String nonce,
    required String acrValues,
  }) async {
    final response = await api.tokenWithHttpInfo(
      realm,
      username,
      password,
      grantType,
      clientId,
      deviceSignature: deviceSignature,
      deviceSignatureAlgorithm: deviceSignatureAlgorithm,
      deviceId: deviceId,
      nonce: nonce,
      acrValues: acrValues,
    );
    if (response.statusCode != HttpStatus.ok) {
      throw ApiException(response.statusCode, response.body);
    }
    return await api.apiClient.deserializeAsync(response.body, "TokenDTO")
        as TokenDTO;
  }

  @override
  Future<ChallengesDTO> authenticate(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
    String acrValues,
    String deviceId,
  ) async {
    final response = await api.tokenWithHttpInfo(
        realm, username, password, grantType, clientId,
        acrValues: acrValues, deviceId: deviceId);
    if (response.statusCode != HttpStatus.unauthorized) {
      throw ApiException(response.statusCode, response.body);
    }
    return await api.apiClient.deserializeAsync(response.body, "ChallengesDTO")
        as ChallengesDTO;
  }

  @override
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
  ) async {
    final response = await api.tokenWithHttpInfo(
        realm, username, password, grantType, clientId,
        deviceSignature: deviceSignature,
        deviceSignatureAlgorithm: deviceSignatureAlgorithm,
        nonce: nonce,
        deviceId: deviceId);
    return response.headers['x-registration-token']!;
  }
}

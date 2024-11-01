import 'dart:io';

import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/login/domain/login_errors.dart';

import '../domain/entity/challenge_entity.dart';
import '../domain/repo/login_repository.dart';
import 'datasource/login_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {

  final LoginDataSource dataSource;
  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<ChallengeEntity>, LoginErrors>> getChallenges(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
  ) async {
    try {
      var challenges = await dataSource.getChallenges(
          realm, username, password, grantType, clientId);
      if (challenges.error != null) {
        return ResultError(InvalidUsernameOrPasswordError());
      }
      return Success(challenges.toChallengesEntity());
    } on ApiException catch (e, stack) {
      print(e);
      print(stack);
      return ResultError(ConnectionError());
    }
  }

  @override
  Future<Result<List<ChallengeEntity>, LoginErrors>> submitChallenge(
      String realm,
      String username,
      String password,
      String grantType,
      String clientId,
      String deviceKey,
      String deviceKeyAlgorithm) async {
    try {
      var challenges = await dataSource.submitChallenge(realm, username,
          password, grantType, clientId, deviceKey, deviceKeyAlgorithm);
      if (challenges.error != null) {
        return ResultError(InvalidUsernameOrPasswordError());
      }
      return Success(challenges.toChallengesEntity());
    } on ApiException catch (e, stack) {
      print(e);
      print(stack);
      return ResultError(ConnectionError());
    }
  }

  @override
  Future<Result<List<ChallengeEntity>, LoginErrors>> authenticate(
    String realm,
    String username,
    String password,
    String grantType,
    String clientId,
    String acrValues,
    String deviceId,
  ) async {
    try {
      var challenges = await dataSource.authenticate(
          realm, username, password, grantType, clientId, acrValues, deviceId);
      if (challenges.error != null) {
        return ResultError(InvalidUsernameOrPasswordError());
      }
      return Success(challenges.toChallengesEntity());
    } on ApiException catch (e, stack) {
      print(e);
      print(stack);
      return ResultError(ConnectionError());
    }
  }

  @override
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
  ) async {
    try {
      var xRegistrationToken = await dataSource.submitSignature(
        realm,
        username,
        password,
        grantType,
        clientId,
        deviceSignature,
        deviceSignatureAlgorithm,
        deviceId,
        nonce,
      );
      return Success(xRegistrationToken);
    } on ApiException catch (e) {
      if (e.code == HttpStatus.unauthorized) {
        return ResultError(InvalidUsernameOrPasswordError());
      }
      return ResultError(ConnectionError());
    }
  }

  @override
  Future<Result<TokenDTO,LoginErrors>> getAccessToken(
      {required String realm,
      required String username,
      required String password,
      required String grantType,
      required String clientId,
      required String deviceSignature,
      required String deviceSignatureAlgorithm,
      required String deviceId,
      required String nonce,
      required String acrValues}) async {
    try {
      var token = await dataSource.getAccessToken(realm: realm, username: username, password: password, grantType: grantType, clientId: clientId, deviceSignature: deviceSignature, deviceSignatureAlgorithm: deviceSignatureAlgorithm, deviceId: deviceId, nonce: nonce, acrValues: acrValues);
      if (token.error != null) {
        return ResultError(InvalidUsernameOrPasswordError());
      }
      return Success(token);
    } on ApiException catch (e) {
      return ResultError(ConnectionError());
    }
  }
}

extension ChallengeEntityMapper on ChallengesDTO {
  List<ChallengeEntity> toChallengesEntity() {
    return challenges
        .map((e) => ChallengeEntity(e.challengeType!, e.nonce, e.deviceId))
        .toList();
  }
}

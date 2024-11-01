import 'dart:io';

import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/passcode/data/datasource/passcode_data_source.dart';

class PasscodeRemoteDataSource implements PasscodeDataSource {
  final DeviceApi api;
  PasscodeRemoteDataSource(this.api);

  @override
  Future<Empty> setPasscode(
    String realm,
    String deviceId,
    String registrationToken,
    SetPassCodeRequest request,
  ) async {
    var response = await api.setPassCodeWithHttpInfo(
        realm, deviceId, registrationToken, request);
    if (response.statusCode != HttpStatus.created) {
      throw ApiException(response.statusCode, response.body);
    }
    return Empty();
  }
}

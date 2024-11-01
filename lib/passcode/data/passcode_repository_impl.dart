import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/passcode_errors.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/repo/passcode_repository.dart';
import 'datasource/passcode_data_source.dart';

class PasscodeRepositoryImpl extends PasscodeRepository {
  final PasscodeDataSource dataSource;

  PasscodeRepositoryImpl(this.dataSource);

  @override
  Future<Result<Empty, PasscodeErrors>> setPasscode(
      String realm,
      String deviceId,
      String registrationToken,
      SetPassCodeRequest request) async {
    try {
      var result = await dataSource.setPasscode(
          realm, deviceId, registrationToken, request);
      return Success(result);
    } catch (e) {
      return ResultError(ConnectionError());
    }
  }
}

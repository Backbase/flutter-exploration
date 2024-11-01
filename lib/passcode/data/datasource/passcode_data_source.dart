import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';

abstract class PasscodeDataSource {
  Future<Empty> setPasscode(
    String realm,
    String deviceId,
    String registrationToken,
    SetPassCodeRequest request,
  );
}

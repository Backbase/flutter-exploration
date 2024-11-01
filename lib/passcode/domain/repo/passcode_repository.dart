import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/passcode_errors.dart';

import '../../../core/domain/result.dart';

abstract class PasscodeRepository {
  Future<Result<Empty, PasscodeErrors>> setPasscode(
    String realm,
    String deviceId,
    String registrationToken,
    SetPassCodeRequest request,
  );
}

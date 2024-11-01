

import 'package:mobile_foundation_headless_flutter/passcode/presentation/ui/passcode_screen_mode.dart';

sealed class PasscodeEvent {
}

class OnLoaded extends PasscodeEvent {
  final PasscodeScreenMode mode;
  OnLoaded(this.mode);
}
class PasscodeVerify extends PasscodeEvent {
  final String passcode;
  PasscodeVerify(this.passcode);
}

class DigitAdded extends PasscodeEvent {
  final String number;
  DigitAdded(this.number);
}
class DigitDeleted extends PasscodeEvent {}

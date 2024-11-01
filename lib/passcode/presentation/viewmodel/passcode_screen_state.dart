import '../../../core/presentation/viewmodel/screen_state.dart';
import '../../domain/passcode_errors.dart';

class PasscodeScreenState extends ScreenState<PasscodeErrors> {
  String onScreenPasscode = "";
  NavigationAction? navigation;

  @override
  void reset() {
    super.reset();
    onScreenPasscode = "";
    navigation = null;
  }

  PasscodeScreenState clone() {
    var passcodeScreenState = PasscodeScreenState();
    passcodeScreenState.onScreenPasscode = onScreenPasscode;
    passcodeScreenState.navigation = navigation;
    passcodeScreenState.error = error;
    passcodeScreenState.isLoading = isLoading;
    passcodeScreenState.isSuccess = isSuccess;
    return passcodeScreenState;
  }
}

enum NavigationAction { navigateToConfirmation, exit }

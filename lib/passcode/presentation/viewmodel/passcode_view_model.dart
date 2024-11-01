import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/passcode_errors.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/viewmodel/passcode_event.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/viewmodel/passcode_screen_state.dart';

import '../../../core/presentation/viewmodel/view_model.dart';
import '../../domain/usecase/confirm_passcode_use_case.dart';
import '../../domain/usecase/set_passcode_use_case.dart';
import '../ui/passcode_screen_mode.dart';

class PasscodeViewModel extends ViewModel<PasscodeScreenState, PasscodeEvent> {
  final SetPasscodeUseCase _setPasscodeUseCase;
  final ConfirmPasscodeUseCase _confirmPasscodeUseCase;
  late PasscodeScreenMode mode;

  PasscodeViewModel(this._setPasscodeUseCase, this._confirmPasscodeUseCase)
      : super(PasscodeScreenState());

  PasscodeScreenState get currentState => state;

  @override
  onEvent(PasscodeEvent event) async {
    switch (event) {
      case DigitAdded():
        await _digitAdded(event.number);
      case DigitDeleted():
        _digitDeleted();
      case OnLoaded():
        mode = event.mode;
      case PasscodeVerify():
    }
  }

  void _digitDeleted() {
    if (state.onScreenPasscode.isNotEmpty) {
      var newState = state.clone();
      newState.onScreenPasscode = newState.onScreenPasscode
          .substring(0, newState.onScreenPasscode.length - 1);
      emit(newState);
    }
  }

  Future<void> _digitAdded(String digit) async {
    if (state.onScreenPasscode.length < 5) {
      var newState = state.clone();
      newState.onScreenPasscode += digit;
      emit(newState);
    }
    if (state.onScreenPasscode.length != 5) {
      return;
    }
    if (mode is ConfirmPasscode) {
      await _confirmPasscode();
    } else {
      await _setPasscodeUseCase(state.onScreenPasscode);
      var newState = state.clone();
      newState.navigation = NavigationAction.navigateToConfirmation;
      emit(newState);
      newState = newState.clone();
      newState.reset();
      emit(newState);
    }
  }

  Future<void> _confirmPasscode() async {
    PasscodeScreenState newState = _showLoading();
    Result<Empty, PasscodeErrors> result =
        await _confirmPasscodeUseCase(state.onScreenPasscode);
    newState.clone();
    newState.clearLoading();
    emit(newState);
    newState = newState.clone();
    switch (result) {
      case Success<Empty, PasscodeErrors>():
        newState.navigation = NavigationAction.exit;
      case ResultError<Empty, PasscodeErrors>():
        newState.onScreenPasscode = "";
        newState.error = result.error;
    }
    emit(newState);
  }

  PasscodeScreenState _showLoading() {
    var newState = state.clone();
    newState.enableLoading();
    emit(newState);
    return newState;
  }
}

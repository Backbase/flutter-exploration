import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/login/domain/login_errors.dart';

import '../../../core/presentation/viewmodel/view_model.dart';
import '../../domain/usecase/login_use_case.dart';
import 'login_event.dart';
import 'login_screen_data.dart';

class LoginViewModel extends ViewModel<LoginScreenState, LoginEvent> {
  final LoginUseCase _useCase;

  final LoginScreenState _state = LoginScreenState();

  LoginViewModel(this._useCase) : super(LoginScreenState());

  @override
  LoginScreenState get state {
    return _state;
  }

  @override
  onEvent(LoginEvent event) async {
    _state.reset();
    _state.enableLoading();
    notifyListeners();
    switch (event) {
      case LoginButtonPressed():
        var result = await _useCase.call(event.userName, event.password);
        switch (result) {
          case Success<Empty, LoginErrors>():
            _state.enableSuccess();
            break;
          case ResultError<Empty, LoginErrors>():
            _state.error = result.error;
            break;
        }
    }
    _state.clearLoading();
    notifyListeners();
  }
}

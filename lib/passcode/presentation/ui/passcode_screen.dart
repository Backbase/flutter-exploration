import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/ui/passcode_content.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/ui/passcode_screen_mode.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/viewmodel/passcode_view_model.dart';

import '../viewmodel/passcode_event.dart';
import '../viewmodel/passcode_screen_state.dart';

class PasscodeScreen extends StatefulWidget {
  final PasscodeScreenMode mode;

  const PasscodeScreen({super.key, required this.mode});

  @override
  State<PasscodeScreen> createState() => _PasscodeScreenState();
}

class _PasscodeScreenState extends State<PasscodeScreen> {
  final PasscodeViewModel _viewModel = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    _viewModel.onEvent(OnLoaded(widget.mode));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PasscodeViewModel, PasscodeScreenState>(
        bloc: _viewModel,
        listener: (context, state) {
          _handleNavigation(context, state);
        },
        builder: (context, state) {
          String title = getTitleFromMode();
          return PasscodeContent(
              title: title,
              state: _viewModel.state,
              onNumberPressed: (number) {
                _viewModel.onEvent(DigitAdded(number));
              },
              onNumberDeleted: () {
                _viewModel.onEvent(DigitDeleted());
              });
        },
      ),
    );
  }

  void _handleNavigation(BuildContext context, PasscodeScreenState state) {
    if (state.navigation != null) {
      switch (state.navigation!) {
        case NavigationAction.navigateToConfirmation:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go("/passcode/confirm_passcode");
          });
        case NavigationAction.exit:
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go("/workspaces", extra: state.onScreenPasscode);
          });
      }
    }
  }

  String getTitleFromMode() {
    switch (widget.mode) {
      case ConfirmPasscode():
        return "Confirm Passcode";
      case SetPasscode():
        return "Enter Passcode";
    }
  }
}

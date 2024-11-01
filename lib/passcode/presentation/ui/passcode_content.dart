import 'package:flutter/material.dart';

import '../../domain/passcode_errors.dart';
import '../viewmodel/passcode_screen_state.dart';

class PasscodeContent extends StatelessWidget {
  final String _title;
  final Function(String) _onNumberPressed;
  final Function() _onNumberDeleted;
  final PasscodeScreenState _state;

  const PasscodeContent(
      {super.key,
      required String title,
      required PasscodeScreenState state,
      required dynamic Function(String) onNumberPressed,
      required dynamic Function() onNumberDeleted})
      : _onNumberDeleted = onNumberDeleted,
        _title = title,
        _onNumberPressed = onNumberPressed,
        _state = state;

  @override
  Widget build(BuildContext context) {
    var errorMsg = getError(context, _state);

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSpace(),
          buildTitle(),
          _buildSpace(),
          buildErrorMessage(errorMsg),
          _buildSpace(),
          _buildPasscodeView(context),
          _buildSpace(),
          Expanded(
            child: (_state.isLoading ? _buildLoading() : _buildNumPad()),
          )
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      )
    ]);
  }

  Row _buildPasscodeView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i = 0; i < _state.onScreenPasscode.length; i++)
          Icon(Icons.circle, color: Theme.of(context).primaryColor),
        for (var i = _state.onScreenPasscode.length; i < 5; i++)
          Icon(Icons.circle, color: Theme.of(context).secondaryHeaderColor),
      ],
    );
  }

  SizedBox _buildSpace() {
    return const SizedBox(
      height: 50,
    );
  }

  Text buildErrorMessage(String errorMsg) {
    return Text(
      errorMsg,
      style: const TextStyle(fontSize: 12, color: Colors.red),
    );
  }

  Text buildTitle() {
    return Text(
      _title,
      style: const TextStyle(fontSize: 24),
    );
  }

  _buildNumPad() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 1; i <= 3; i++)
              _NumberButton(number: i.toString(), onPressed: _onNumberPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 4; i <= 6; i++)
              _NumberButton(number: i.toString(), onPressed: _onNumberPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (var i = 7; i <= 9; i++)
              _NumberButton(number: i.toString(), onPressed: _onNumberPressed),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 50,
              height: 50,
            ),
            _NumberButton(number: "0", onPressed: _onNumberPressed),
            IconButton(
              icon: const Icon(Icons.backspace),
              onPressed: _onNumberDeleted,
            ),
          ],
        ),
      ],
    );
  }

  String getError(BuildContext context, PasscodeScreenState state) {
    var error = state.error;
    return switch (error) {
      null => "",
      PasscodeDoNotMatch() => "Passcode do not match, please try again",
      ConnectionError() => "Check if you have a working network connection",
      DataNotFound() =>"Unexpected error occurred, passcode not found",
      UnExpectedError() => "Unexpected error occurred",
    };
  }
}

class _NumberButton extends StatelessWidget {
  final String number;
  final Function(String) onPressed;

  const _NumberButton({required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: const ButtonStyle(
            shape: MaterialStatePropertyAll<OutlinedBorder>(
                ContinuousRectangleBorder()),
          ),
          onPressed: () {
            onPressed(number);
          },
          child: Text(number, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}

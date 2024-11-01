import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_foundation_headless_flutter/login/presentation/viewmodel/login_event.dart';
import 'package:mobile_foundation_headless_flutter/login/presentation/viewmodel/login_view_model.dart';

import '../../domain/login_errors.dart';
import '../viewmodel/login_screen_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginViewModel _viewModel = GetIt.instance.get();
  final TextEditingController _userNameController =TextEditingController(text: "");
  final TextEditingController _passwordController =TextEditingController(text: "");
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (BuildContext context, Widget? child) {
            if(_viewModel.state.isSuccess){
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go("/passcode");
              });
            }
            return _buildLoginScreen(_viewModel.state);
          },
        ),
      ),
    );
  }

  Widget _buildLoginScreen(LoginScreenState state) {
    String error = getError(context, state) ?? "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        TextFormField(
          controller: _userNameController,
          decoration: const InputDecoration(labelText: 'Username'),
          validator: (value) {
            return 'Please enter your email';
          },
        ),
        const SizedBox(height: 16.0),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          obscureText: _obscureText,
          validator: (value) {
            return "";
          },
        ),
        const SizedBox(height: 30.0),
        Align(
          alignment: Alignment.center,
          child: Text(
            error,
            style: const TextStyle(color: Color(0xFFD32C2C)),
          ),
        ),
        const SizedBox(height: 30.0),
        ElevatedButton(
          onPressed: state.isLoading
              ? null
              : () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  String username = _userNameController.text;
                  String password = _passwordController.text;
                  _viewModel.onEvent(LoginButtonPressed(username, password));
                },
          child: state.isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(),
                )
              : const Text('LOGIN'),
        ),
      ],
    );
  }

  String getError(BuildContext context, LoginScreenState state) {
    var error = state.error;
    return switch (error) {
      null => "",
      InvalidUsernameOrPasswordError() => "Invalid username or password",
      ConnectionError() => "Check if you have a working network connection",
      UnExpectedError() => "Unexpected error occurred",
    };
  }
}

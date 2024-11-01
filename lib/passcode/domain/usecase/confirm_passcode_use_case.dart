import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:generated_services/api.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/passcode_errors.dart'
    as pass_code_error;
import '../../../core/domain/storage_service.dart';

class ConfirmPasscodeUseCase {
  final StorageService storageService;
  final BackbaseFoundationPlugin plugin;

  ConfirmPasscodeUseCase(
    this.plugin,
    this.storageService,
  );

  Future<Result<Empty, pass_code_error.PasscodeErrors>> call(
      String passcode) async {
    var previousPasscode = await storageService.readPasscode();
    if (previousPasscode == null) {
      return ResultError(pass_code_error.DataNotFound());
    }
    if (previousPasscode != passcode) {
      return ResultError(pass_code_error.PasscodeDoNotMatch());
    }
    try {
      var bearerToken = await plugin.enterPasscode(passcode);
      var split = bearerToken!.split(' ');
      var tokenType = split[0];
      var accessToken = split[1];
      await storageService.clear();
      await storageService.writeToken(TokenDTO(
          accessToken: accessToken,
          expiresIn: 1000,
          refreshExpiresIn: 1000,
          refreshToken: "",
          tokenType: tokenType,
          notBeforePolicy: 1000,
          sessionState: "",
          scope: "",
          error: "",
          errorDescription: ""));
      return Success(Empty());
    } catch (e) {
      print(e);
      return ResultError(pass_code_error.UnExpectedError());
    }
  }
}

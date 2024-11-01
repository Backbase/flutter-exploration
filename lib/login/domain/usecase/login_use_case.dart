import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';

import '../../../core/domain/result.dart';
import '../login_errors.dart';

class LoginUseCase {
  final BackbaseFoundationPlugin plugin;

  LoginUseCase(this.plugin);

  Future<Result<Empty, LoginErrors>> call(String username, String password) async {
    try {
      await plugin.authenticate(username, password);
      return Success(Empty.instance);
    } catch (e) {
      return ResultError(UnExpectedError());
    }
  }
}

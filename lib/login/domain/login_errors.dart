import '../../core/domain/error.dart';

sealed class LoginErrors extends Error{}

class InvalidUsernameOrPasswordError extends LoginErrors{}
class ConnectionError extends LoginErrors{}
class UnExpectedError extends LoginErrors{}

import '../../core/domain/error.dart';

sealed class PasscodeErrors extends Error {}

class PasscodeDoNotMatch extends PasscodeErrors {}

class DataNotFound extends PasscodeErrors {}

class ConnectionError extends PasscodeErrors {}

class UnExpectedError extends PasscodeErrors {}

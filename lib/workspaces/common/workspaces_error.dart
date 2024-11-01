import '../../core/domain/error.dart';

sealed class WorkspacesError extends Error {}

class ConnectionError extends WorkspacesError {}
class UnExpectedError extends WorkspacesError {}
class SelectWorkspaceError extends WorkspacesError {}

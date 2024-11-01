import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';

abstract class WorkspacesDataSource {
  Future<Result<List<Workspace>, WorkspacesError>> getWorkspaces(WorkspacesParams params);
}

class WorkspacesParams {
  final String? query;
  final int? from;
  final int? size;
  final String authorization;
  final String apiKey;
  WorkspacesParams(this.authorization,this.apiKey, {this.query, this.from, this.size});
}

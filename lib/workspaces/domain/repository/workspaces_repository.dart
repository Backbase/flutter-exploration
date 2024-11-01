import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';

abstract class WorkspacesRepository {
  Future<Result<List<Workspace>, WorkspacesError>> getWorkspaces(String auth,String apiKey);
  Result<Workspace, WorkspacesError> selectWorkspace(String id);
} 

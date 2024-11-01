import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/repository/workspaces_repository.dart';

class SelectWorkspaceUseCase {
  final WorkspacesRepository workspacesRepository;
  
  SelectWorkspaceUseCase(this.workspacesRepository);

  Result<Workspace, WorkspacesError> call(String id) {
      return workspacesRepository.selectWorkspace(id);
  }
}

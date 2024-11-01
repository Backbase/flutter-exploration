import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/data/datasource/workspaces_data_source.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/repository/workspaces_repository.dart';

class WorkspacesRepositoryImpl implements WorkspacesRepository {
  final WorkspacesDataSource dataSource;
  final List<Workspace> _workspaces = List.empty(growable: true);
  int currentPage = 0;

  WorkspacesRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Workspace>, WorkspacesError>> getWorkspaces(String auth,String apiKey) async {
    late Result<List<Workspace>, WorkspacesError> result;
    List<Workspace> workspaces = List.empty();
    if (currentPage != -1) {
      var params = WorkspacesParams(auth,apiKey,from: currentPage, size: 20);
      result = await dataSource.getWorkspaces(params);
      switch (result) {
        case Success<List<Workspace>, WorkspacesError>():
          workspaces = result.data;
          break;
        case ResultError<List<Workspace>, WorkspacesError>():
          result = result;
          break;
      }
    }
    if (workspaces.isNotEmpty) {
      currentPage++;
    } else {
      currentPage = -1;
    }
    _workspaces.addAll(workspaces);
    return result;
  }

  @override
  Result<Workspace, WorkspacesError> selectWorkspace(String id) {
    try {
      Workspace workspace = _workspaces.firstWhere((workspace) => workspace.id == id);
      return Success(workspace);
    } catch (e) {
      return ResultError(SelectWorkspaceError());
    }
  }
}

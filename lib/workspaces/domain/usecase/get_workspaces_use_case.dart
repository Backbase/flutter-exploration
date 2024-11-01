import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/storage_service.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/use_case_config.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/repository/workspaces_repository.dart';

class GetWorkSpacesUseCase {
  final WorkspacesRepository _workspacesRepository;
  final StorageService _storageService;
  final UseCaseConfig config;

  GetWorkSpacesUseCase(
      this._workspacesRepository,
      this._storageService,
      this.config
      );

  Future<Result<List<Workspace>, WorkspacesError>> call() async {
    var token=await _storageService.readToken();
    if(token==null){
      return ResultError(UnExpectedError());
    }
    String auth="${token.tokenType} ${token.accessToken}";
    return _workspacesRepository.getWorkspaces(auth,config.apiKey);
  }
}

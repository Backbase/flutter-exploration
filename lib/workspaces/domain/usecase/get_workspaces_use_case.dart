import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/result.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/use_case_config.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/common/workspaces_error.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/model/workspace.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/repository/workspaces_repository.dart';

class GetWorkSpacesUseCase {
  final WorkspacesRepository _workspacesRepository;
  final BackbaseFoundationPlugin _plugin;
  final UseCaseConfig config;

  GetWorkSpacesUseCase(
      this._workspacesRepository,
      this._plugin,
      this.config
      );

  Future<Result<List<Workspace>, WorkspacesError>> call() async {
    var bearerToken=await _plugin.getToken();
    if(bearerToken==null){
      return ResultError(UnExpectedError());
    }
    var split = bearerToken.split(' ');
    var tokenType = split[0];
    var accessToken = split[1];
    String auth="$tokenType $accessToken";
    return _workspacesRepository.getWorkspaces(auth,config.apiKey);
  }
}

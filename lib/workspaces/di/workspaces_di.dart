import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:generated_services/api.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/storage_service.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/data/remote/workspaces_remote_data_source.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/data/datasource/workspaces_data_source.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/data/repository/workspaces_repository_impl.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/repository/workspaces_repository.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/usecase/get_workspaces_use_case.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/domain/usecase/select_workspace_use_case.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/presentation/viewmodel/workspaces_view_model.dart';

import '../../core/domain/use_case_config.dart';

void setupWorkspacesModule() {
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<WorkspaceApi>(() => WorkspaceApi(getIt.get<ApiClient>(instanceName:"application")));
  getIt.registerFactory<WorkspacesDataSource>(
      () => WorkspacesRemoteDataSource((getIt.get<WorkspaceApi>())));
  getIt.registerLazySingleton<WorkspacesRepository>(
      () => WorkspacesRepositoryImpl(getIt.get<WorkspacesDataSource>()));
  getIt.registerFactory<GetWorkSpacesUseCase>(
      () => GetWorkSpacesUseCase(
          getIt.get<WorkspacesRepository>(),
          getIt.get<BackbaseFoundationPlugin>(),
          getIt.get<UseCaseConfig>()
      ));
  getIt.registerFactory<SelectWorkspaceUseCase>(
      () => SelectWorkspaceUseCase(getIt.get<WorkspacesRepository>()));
  getIt.registerFactory<WorkspacesViewModel>(() => WorkspacesViewModel(
      getIt.get<GetWorkSpacesUseCase>(), getIt.get<SelectWorkspaceUseCase>()));
}

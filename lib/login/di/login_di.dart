import 'package:generated_services/api.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/use_case_config.dart';
import 'package:mobile_foundation_headless_flutter/login/data/datasource/login_data_source.dart';
import 'package:mobile_foundation_headless_flutter/login/domain/repo/login_repository.dart';
import 'package:mobile_foundation_headless_flutter/login/presentation/viewmodel/login_view_model.dart';

import '../../core/domain/storage_service.dart';
import '../data/datasource/remote/login_remote_data_source.dart';
import '../data/login_repository_impl.dart';
import '../domain/usecase/login_use_case.dart';

void setupLoginModule() {
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<TokenApi>(
      () => TokenApi(getIt.get<ApiClient>(instanceName: "identity")));
  getIt.registerFactory<LoginDataSource>(
      () => LoginRemoteDataSource(getIt.get<TokenApi>()));
  //this needs to be singleton
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getIt.get<LoginDataSource>()));
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(
      getIt.get<LoginRepository>(),
      getIt.get<StorageService>(),
      getIt.get<UseCaseConfig>()));
  getIt.registerFactory<LoginViewModel>(
      () => LoginViewModel(getIt.get<LoginUseCase>()));
}

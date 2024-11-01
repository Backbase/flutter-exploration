import 'package:generated_services/api.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_foundation_headless_flutter/passcode/data/datasource/remote/passcode_remote_data_source.dart';
import 'package:mobile_foundation_headless_flutter/passcode/domain/repo/passcode_repository.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/viewmodel/passcode_view_model.dart';

import '../../core/domain/storage_service.dart';
import '../../core/domain/use_case_config.dart';
import '../../login/domain/repo/login_repository.dart';
import '../data/datasource/passcode_data_source.dart';
import '../data/passcode_repository_impl.dart';
import '../domain/usecase/confirm_passcode_use_case.dart';
import '../domain/usecase/set_passcode_use_case.dart';



void setupPasscodeModule(){
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<DeviceApi>(() => DeviceApi(getIt.get<ApiClient>(instanceName:"identity")));
  getIt.registerFactory<PasscodeDataSource>(() => PasscodeRemoteDataSource(getIt.get<DeviceApi>()));
  //this needs to be singleton
  getIt.registerLazySingleton<PasscodeRepository>(() => PasscodeRepositoryImpl(getIt.get<PasscodeDataSource>()));
  getIt.registerFactory<SetPasscodeUseCase>(() => SetPasscodeUseCase(getIt.get<PasscodeRepository>(),getIt.get<StorageService>()));
  getIt.registerFactory<ConfirmPasscodeUseCase>(() => ConfirmPasscodeUseCase(
      getIt.get<PasscodeRepository>(),
      getIt.get<LoginRepository>(),
      getIt.get<StorageService>(),
      getIt.get<UseCaseConfig>()),
  );

  getIt.registerFactory<PasscodeViewModel>(() => PasscodeViewModel(
      getIt.get<SetPasscodeUseCase>(),
      getIt.get<ConfirmPasscodeUseCase>()
  ));
}

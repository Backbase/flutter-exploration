import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_foundation_headless_flutter/passcode/presentation/viewmodel/passcode_view_model.dart';
import '../../core/domain/storage_service.dart';
import '../domain/usecase/confirm_passcode_use_case.dart';
import '../domain/usecase/set_passcode_use_case.dart';



void setupPasscodeModule(){
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<SetPasscodeUseCase>(() => SetPasscodeUseCase(getIt.get<StorageService>()));
  getIt.registerFactory<ConfirmPasscodeUseCase>(() => ConfirmPasscodeUseCase(
      getIt.get<BackbaseFoundationPlugin>(),
      getIt.get<StorageService>(),
  ));
  getIt.registerFactory<PasscodeViewModel>(() => PasscodeViewModel(
      getIt.get<SetPasscodeUseCase>(),
      getIt.get<ConfirmPasscodeUseCase>()
  ));
}

import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_foundation_headless_flutter/login/presentation/viewmodel/login_view_model.dart';
import '../domain/usecase/login_use_case.dart';
void setupLoginModule() {
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt.get<BackbaseFoundationPlugin>()));
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt.get<LoginUseCase>()));
}

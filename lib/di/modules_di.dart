import 'dart:io';

import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:generated_services/api.dart';
import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:mobile_foundation_headless_flutter/core/data/In_memory_storage_impl.dart';
import 'package:mobile_foundation_headless_flutter/core/data/local_repository_impl.dart';
import 'package:mobile_foundation_headless_flutter/core/data/secure_storage_impl.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/repo/local_repository.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/storage_service.dart';
import 'package:mobile_foundation_headless_flutter/core/domain/use_case_config.dart';
import 'package:mobile_foundation_headless_flutter/workspaces/di/workspaces_di.dart';

import '../login/di/login_di.dart';
import '../passcode/di/passcode_di.dart';

void setupAppModules() {
  setupAppModule();
  setupLoginModule();
  setupPasscodeModule();
  setupWorkspacesModule();
}

void setupAppModule() {
  GetIt getIt = GetIt.instance;
  getIt.registerFactory<BackbaseFoundationPlugin>(
      () => BackbaseFoundationPlugin());
  var application =
  ApiClient(basePath: 'https://app.stg.sdbxaz.azure.backbaseservices.com');

  /// enable proxy on android
  //addProxyProxyClient([identity, application]);

  getIt.registerLazySingleton<UseCaseConfig>(
    () => UseCaseConfig(),
  );
  getIt.registerLazySingleton<ApiClient>(() => application,
      instanceName: "application");
  getIt.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(InMemoryStorageImpl(), SecureStorageImpl()));
  getIt.registerFactory<StorageService>(
      () => StorageService(getIt.get<LocalRepository>()));
}

void addProxyProxyClient(List<ApiClient> apiClients) {
  for (var element in apiClients) {
    HttpClient httpClient = HttpClient()
      ..findProxy = (uri) {
        return "PROXY 10.0.2.2:8080";
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    element.client = IOClient(httpClient);
  }
}

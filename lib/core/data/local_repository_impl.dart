import 'package:mobile_foundation_headless_flutter/core/domain/repo/storage.dart';

import '../domain/repo/local_repository.dart';

class LocalRepositoryImpl extends  LocalRepository{
  final Storage _inMemoryStorage;
  final Storage _secureStorage;
  LocalRepositoryImpl(this._inMemoryStorage, this._secureStorage);
  @override
  Storage get inMemoryStorage => _inMemoryStorage;
  @override
  Storage get secureStorage => _secureStorage;
}

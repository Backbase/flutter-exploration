import 'package:mobile_foundation_headless_flutter/core/domain/repo/storage.dart';

abstract class LocalRepository {
  Storage get inMemoryStorage;
  Storage get secureStorage;
}

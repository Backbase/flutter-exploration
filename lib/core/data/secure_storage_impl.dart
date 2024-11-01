
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/repo/storage.dart';


class SecureStorageImpl extends Storage{
  final _storage = const FlutterSecureStorage();
  @override
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }
  @override
  Future<bool> hasKey(String key) async{
    return await read(key)!=null;
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }
  @override
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }
  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}

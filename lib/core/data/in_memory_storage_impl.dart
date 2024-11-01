
import '../domain/repo/storage.dart';

class InMemoryStorageImpl extends Storage {
  final Map<String, String> _data = {};

  /// Sets a value for a given key.
  @override
  Future<void> write(String key, String value) async {
    _data[key] = value;
  }

  /// Gets the value for a given key.
  /// Returns null if the key does not exist.
  @override
  Future<String?> read(String key) async {
    return _data[key];
  }

  /// Checks if a key exists in the storage.
  @override
  Future<bool> hasKey(String key) async {
    return _data.containsKey(key);
  }

  /// Removes a key-value pair from the storage.
  @override
  Future<void> delete(String key) async {
    _data.remove(key);
  }

  /// Clears all key-value pairs from the storage.
  @override
  Future<void> clear() async {
    _data.clear();
  }
}

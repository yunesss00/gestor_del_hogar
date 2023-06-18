
abstract class KeyValueStorageService {
  Future<T?> getValue<T>(String key);
  Future<bool> removeKey(String key);
  Future<void> setKeyValue<T>(String key, T value);
}

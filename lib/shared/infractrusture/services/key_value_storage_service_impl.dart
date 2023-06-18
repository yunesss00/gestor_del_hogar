import 'package:shared_preferences/shared_preferences.dart';
import 'key_value_storage_service.dart';

class KeyValueStorageServiceImpl implements KeyValueStorageService {

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPreferences();
    return prefs.getString(key) as T?;

  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPreferences();
    return await prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async{
    final prefs = await getSharedPreferences();
    prefs.setString(key, value as String);
  }
}

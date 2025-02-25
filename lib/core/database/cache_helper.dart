import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  // initialize of cache
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // save data in local database using key
  Future<bool> saveData({required String key, required dynamic value}) {
    if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is String) {
      return _prefs.setString(key, value);
    } else if (value is int) {
      return _prefs.setInt(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return _prefs.setStringList(key, value);
    } else {
      throw Exception('Invalid value type');
    }
  }

  // get data already saved in  local database uing key
  dynamic getData({required String key}) {
    return _prefs.get(key);
  }

  // remov data using key
  Future<bool> removeData({required String key}) {
    return _prefs.remove(key);
  }

  // check if local database contains keys
  bool containsKey({required String key}) {
    return _prefs.containsKey(key);
  }

  // clear all data in the local database
  Future<bool> clearData() {
    return _prefs.clear();
  }
}

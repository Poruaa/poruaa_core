import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  final SharedPreferences _sharedPreferences;
  SharedPreferenceService(this._sharedPreferences);

  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  void setInt(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  void setString(String key, String value) {
    _sharedPreferences.setString(key, value);
  }
}

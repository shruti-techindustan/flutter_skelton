import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  SharedPreferences prefs;

  Future<String> getStringPrefs(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(key ?? "");
  }

  updateStringPrefs(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  updateBooleanPrefs(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> getBooleanPrefs(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key ?? false);
  }

  clearAllPrefs() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

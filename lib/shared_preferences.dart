import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static final SharedPreferenceService _instance = SharedPreferenceService._internal();

  factory SharedPreferenceService() {
    return _instance;
  }

  SharedPreferenceService._internal();

  Future<SharedPreferences> sharedPreferences() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> read(String key) async {
    var prefs = await sharedPreferences();
    return prefs.getString(key) ?? "";
  }

  void write(String key, dynamic value) async {
    var prefs = await sharedPreferences();
    prefs.setString(key, value);
  }
}

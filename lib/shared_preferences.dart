import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  late SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String read(String key) {
    return _prefs.getString(key) ?? "";
  }

  void write(String key, dynamic value) {
    _prefs.setString(key, value);
  }
}

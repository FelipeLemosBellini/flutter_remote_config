import 'package:firebase_remote_config_app/remote_config.dart';
import 'package:firebase_remote_config_app/shared_preferences.dart';

class SettingsApp {
  Future<void> setApiKey() async {
    print("chegamo");
    await RemoteConfigService().initialize();
    SharedPreferenceService().initialize();
    String apiKey = RemoteConfigService().getString("api_key");

    SharedPreferenceService().write("apiKey", apiKey);
    print(apiKey);
  }
}

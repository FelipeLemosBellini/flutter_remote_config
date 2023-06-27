import 'package:using_remote_config/remote_config.dart';
import 'package:using_remote_config/shared_preferences.dart';

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

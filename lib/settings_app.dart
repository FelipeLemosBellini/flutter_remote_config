import 'package:using_remote_config/remote_config_service.dart';
import 'package:using_remote_config/shared_preferences.dart';

class SettingsApp {
  Future<void> setApiKey() async {
    print("chegamo");
    await RemoteConfigService().initialize();
    String apiKey = RemoteConfigService().getString("api_key");
    SharedPreferenceService().write("api_key", apiKey);
    print(apiKey);
  }
}

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    try {
      await _remoteConfig.setDefaults(<String, dynamic>{});
      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      print('Erro ao inicializar o Remote Config: $e');
    }
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  bool getBool(String key) {
    bool result = _remoteConfig.getBool(key);
    return result;
  }
}

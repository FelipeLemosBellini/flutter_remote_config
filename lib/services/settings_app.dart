import 'dart:convert';

import 'package:using_remote_config/model/services_model.dart';
import 'package:using_remote_config/services/remote_config_service.dart';

class SettingsApp {
  static final SettingsApp _instance = SettingsApp._internal();

  factory SettingsApp() => _instance;

  SettingsApp._internal();

  bool isCircuitBreaker = false;
  ServicesModel servicesModel = ServicesModel.defaultModel();

  Future<void> setRemoteConfig() async {
    RemoteConfigService remote = RemoteConfigService();
    await remote.initialize();
    isCircuitBreaker = remote.getBool("is_circuit_breaker");
    // String services = remote.getString("services").toString();
    // Map<String, dynamic> jsonMap = json.decode(services);
    //
    // servicesModel = ServicesModel.fromMap(jsonMap);
  }
}

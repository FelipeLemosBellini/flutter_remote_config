import 'package:flutter/material.dart';
import 'package:using_remote_config/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String apiKey = "";

  @override
  void initState() {
    _getApiKey();
    super.initState();
  }

  void _getApiKey() {
    SharedPreferenceService().initialize();

    setState(() => apiKey = SharedPreferenceService().read("api_key"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(apiKey)),
    );
  }
}

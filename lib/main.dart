import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:using_remote_config/firebase_options.dart';
import 'package:using_remote_config/home_page.dart';
import 'package:using_remote_config/settings_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await SettingsApp().setApiKey();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

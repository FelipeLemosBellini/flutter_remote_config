import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:using_remote_config/model/services_model.dart';
import 'package:using_remote_config/services/settings_app.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCircuitBreaker = false;
  ServicesModel servicesModel = ServicesModel.defaultModel();

  @override
  void initState() {
    _verifyCircuitBreaker();
    super.initState();
  }

  void _verifyCircuitBreaker() {
    setState(() {
      isCircuitBreaker = SettingsApp().isCircuitBreaker;
      servicesModel = SettingsApp().servicesModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF353535),
        body: isCircuitBreaker
            ? Center(
                child: Container(
                    margin: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.red[200],
                        border: Border.all(color: Colors.red, width: 2),
                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                    child: const Text("Bolsa fechada", style: TextStyle(color: Colors.black, fontSize: 20))))
            : Center(
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      card(title: "buy", isEnabled: servicesModel.buy),
                      card(title: "sell", isEnabled: servicesModel.sell),
                      card(title: "deposit", isEnabled: servicesModel.deposit),
                      card(title: "convert", isEnabled: servicesModel.convert),
                      card(title: "leverage", isEnabled: servicesModel.leverage),
                    ]))));
  }

  Widget card({required String title, required bool isEnabled}) {
    return GestureDetector(
        onTap: isEnabled ? () => HapticFeedback.lightImpact() : () {},
        child: Container(
            margin: const EdgeInsets.all(16),
            height: 90,
            width: 120,
            decoration: BoxDecoration(
                color: isEnabled ? Colors.white10 : Colors.white12,
                border: Border.all(color: isEnabled ? Colors.white : Colors.black, width: 1, style: BorderStyle.solid),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Center(
                child: Text(title, style: TextStyle(color: isEnabled ? Colors.white : Colors.white30, fontSize: 16)))));
  }
}

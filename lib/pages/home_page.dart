import 'package:flutter/material.dart';
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
                      card(title: "buy", disable: servicesModel.buy),
                      card(title: "sell", disable: servicesModel.sell),
                      card(title: "deposit", disable: servicesModel.deposit),
                      card(title: "convert", disable: servicesModel.convert),
                      card(title: "leverage", disable: servicesModel.leverage),
                    ]))));
  }

  Widget card({required String title, required bool disable}) {
    return Container(
        margin: const EdgeInsets.all(16),
        height: 90,
        width: 120,
        decoration: BoxDecoration(
            color: disable ? Colors.white10 : Colors.white12,
            border: Border.all(color: disable ? Colors.white : Colors.black, width: 1, style: BorderStyle.solid),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Center(
            child: Text(title, style: TextStyle(color: disable ? Colors.white : Colors.white30, fontSize: 16))));
  }
}

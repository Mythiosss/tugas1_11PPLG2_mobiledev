import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
  final splash = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ini Splashscreen"),
      ),
    );
  }
}
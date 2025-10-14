import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';
import 'package:tugas_flutter_1/controllers/responsive_controller.dart';
import 'package:tugas_flutter_1/pages/login_page.dart';
import 'package:tugas_flutter_1/pages/widescreen/login_widescreen_page.dart';

class LoginResponsive extends StatelessWidget {
  LoginResponsive({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value ? LoginPage() : LoginPageWidescreen());
      }),
    );
  }
}
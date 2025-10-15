import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';
import 'package:tugas_flutter_1/controllers/responsive_controller.dart';
import 'package:tugas_flutter_1/fragments/history_page.dart';
import 'package:tugas_flutter_1/fragments/home_page.dart';
import 'package:tugas_flutter_1/pages/amir_profile.dart';
import 'package:tugas_flutter_1/pages/login_page.dart';
import 'package:tugas_flutter_1/pages/sharlyf_profile.dart';
import 'package:tugas_flutter_1/pages/widescreen/amir_widescreen.dart';
import 'package:tugas_flutter_1/pages/widescreen/history_widescreen.dart';
import 'package:tugas_flutter_1/pages/widescreen/home_widescreen_page.dart';
import 'package:tugas_flutter_1/pages/widescreen/login_widescreen_page.dart';
import 'package:tugas_flutter_1/pages/widescreen/sharlyf_profile_widescreen.dart';

class HistoryResponsive extends StatelessWidget {
  HistoryResponsive({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        controller.updateLayout(constraints);
        return Obx(() => controller.isMobile.value ? HistoryPage() : HistoryWidescreen());
      }),
    );
  }
}
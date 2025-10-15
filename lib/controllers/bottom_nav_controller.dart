import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/fragments/history_page.dart';
import 'package:tugas_flutter_1/fragments/profile_page.dart';
import 'package:tugas_flutter_1/fragments/home_page.dart';
import 'package:tugas_flutter_1/pages/responsive/history_responsive.dart';
import 'package:tugas_flutter_1/pages/responsive/home_responsive.dart';
import 'package:tugas_flutter_1/pages/widescreen/history_widescreen.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeResponsive(),
    HistoryResponsive(),
    ProfilePage()
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
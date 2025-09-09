import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/fragments/history_page.dart';
import 'package:tugas_flutter_1/fragments/profile_page.dart';
// import 'package:tugas_flutter_1/fragments/home_page.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    // HomePage(),
    HistoryPage(),
    ProfilePage()
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
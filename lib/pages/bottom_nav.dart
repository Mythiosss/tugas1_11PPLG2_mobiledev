import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:tugas_flutter_1/controllers/bottom_nav_controller.dart';

class BottomNav extends StatelessWidget {
  final BottomNavController bottomController = Get.put(BottomNavController());

  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: bottomController.pages[bottomController.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        onTap: bottomController.changePage,
        currentIndex: bottomController.selectedIndex.value,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task_alt_sharp), label: "Todo List"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    ),);
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/routes/routes.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  var rememberMe = false.obs;


  void auth() {
    String usernameToString = username.text.toString().trim();
    String passwordToString = password.text.toString().trim();

    if (username.text.isEmpty || password.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields");
    } else {
      Get.snackbar("Success", "Welcome ${username.text}!");
    }

    if (usernameToString == "mythios" && passwordToString == "detarune") {
      Get.snackbar(
        "Auth",
        "Login Berhasil",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 2),
      );
      Get.offNamed(AppRoutes.mainMenuPage);
    } else {
      Get.snackbar(
        "Auth",
        "Login Gagal",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
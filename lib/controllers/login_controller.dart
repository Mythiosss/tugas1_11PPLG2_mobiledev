import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http; // ← penting, ini yang kamu lupa import
import '../models/login_model.dart';
import '../routes/routes.dart';

class LoginAPIController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final url = Uri.parse("https://mediadwi.com/api/latihan/login");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "username": username.text.trim(),
          "password": password.text.trim(),
        }),
      );

      final jsonResponse = jsonDecode(response.body);

      // parsing data
      final data = LoginResponse.fromJson(jsonResponse);

      if (data.status == "success") {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", data.token ?? "");

        Get.snackbar(
          "Success",
          data.message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.offAllNamed(AppRoutes.mainMenuPage);
      } else {
        Get.snackbar(
          "Failed",
          data.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Network Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

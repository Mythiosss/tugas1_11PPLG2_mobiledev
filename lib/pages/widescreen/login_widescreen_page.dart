import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';
import 'package:tugas_flutter_1/widgets/custom_tf.dart'; // file CustomTextField lo

class LoginPageWidescreen extends StatelessWidget {
  LoginPageWidescreen({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final teal = const Color(0xFF7FD6D6);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          // =====================================
          // KIRI — Branding dan ilustrasi
          // =====================================
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(64),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [teal, teal.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Du-Itin!',
                    style: TextStyle(
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Kelola tugas dan rencanakan harimu dengan lebih mudah.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.15),
                      border: Border.all(color: Colors.white, width: 3),
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // =====================================
          // KANAN — Form login
          // =====================================
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 420,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Selamat Datang!",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),

                    CustomTextField(
                      controller: controller.username,
                      label: 'Username',
                      hint: 'Masukkan username kamu',
                      prefixIcon: Icons.person_outline,
                    ),
                    const SizedBox(height: 24),

                    CustomTextField(
                      controller: controller.password,
                      label: 'Password',
                      hint: 'Masukkan password kamu',
                      prefixIcon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 18),

                    Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (val) {
                                controller.rememberMe.value = val!;
                              },
                              activeColor: teal,
                            ),
                            const Text(
                              "Ingat saya",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Get.snackbar(
                              "Lupa Password",
                              "Mengalihkan ke halaman reset password...",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Text(
                            "Lupa Password?",
                            style: TextStyle(
                              color: teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(height: 30),

                    CustomButton(
                      text: "Login",
                      textColor: Colors.white,
                      bgColor: teal,
                      onPressed: () => controller.auth(),
                    ),

                    const SizedBox(height: 40),

                    GestureDetector(
                      onTap: () {
                        Get.snackbar(
                          "Sign Up",
                          "Mengalihkan ke halaman pendaftaran...",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Belum punya akun? ",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          children: [
                            TextSpan(
                              text: "Daftar Sekarang",
                              style: TextStyle(
                                color: teal,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.find<AuthController>();
  final ValueNotifier<bool> hidePass = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              cs.primary.withOpacity(0.1),
              const Color.fromARGB(184, 206, 205, 205),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/icon.png', height: 56),
                      const SizedBox(height: 8),
                      const Text(
                        'Todolist App',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // email
                      Te(
                        label: 'Username',
                        prefixIcon: const Icon(Icons.email_outlined),
                        controller: controller.username,
                      ),
                      const SizedBox(height: 8),

                      // password + toggle show/hide
                      ValueListenableBuilder<bool>(
                        valueListenable: hidePass,
                        builder: (context, value, _) {
                          return AppTextField(
                            label: 'Password',
                            obscureText: value,
                            prefixIcon: const Icon(Icons.lock_outline),
                            controller: controller.password,
                            suffixIcon: IconButton(
                              onPressed: () => hidePass.value = !value,
                              icon: Icon(
                                value ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 12),
                      AppButton(
                        text: 'Login',
                        onPressed: () {
                          controller.auth();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/todo_binding.dart';
import 'routes/pages.dart';
import 'routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
      initialBinding: TodoBinding(),
    );
  }
}

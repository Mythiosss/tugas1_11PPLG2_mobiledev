import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/bindings/todo_binding.dart';
import 'package:tugas_flutter_1/routes/pages.dart';
import 'package:tugas_flutter_1/routes/routes.dart';
// import 'package:tugas_flutter_1/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
      initialBinding: TodoBinding(),
    );
  }
}
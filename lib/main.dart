import 'package:flutter/material.dart';
import 'package:tugas_flutter_1/routes/pages.dart';
import 'package:tugas_flutter_1/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.profilePage,
    );
  }
}

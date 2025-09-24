import 'package:flutter/material.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Ini Splashscreen"),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class CustomTf extends StatelessWidget {

  final TextEditingController controller;
  final InputDecoration decoration;

  const CustomTf({super.key, required this.controller, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: decoration,
    );
  }
}
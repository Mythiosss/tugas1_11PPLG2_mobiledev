import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String myText;
  final Color myTextColor;
  final Color myBgColor;
  final VoidCallback onPressed;

  const CustomButton({super.key, 
    required this.myText, 
    required this.myTextColor, 
    required this.myBgColor,
    required this.onPressed,  
    });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: myBgColor,
      ),
      child: Text(
        myText, 
        style: TextStyle(color: myTextColor),
      ),);
  }
}
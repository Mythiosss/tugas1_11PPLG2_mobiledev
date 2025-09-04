import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: -90,
                top: -82,
                child: Container(
                  width: 610,
                  height: 438,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF3E442B),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 152,
                top: 164,
                child: Container(
                  width: 125,
                  height: 125,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(),
                ),
              ),
              Positioned(
                left: 107,
                top: 35,
                child: Text(
                  'DO-IT!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 96,
                    fontFamily: 'Jockey One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ]
          )
        )
    ]);
  }
}
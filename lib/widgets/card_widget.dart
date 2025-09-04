import 'package:flutter/material.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';

class CardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 383,
          height: 74,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 383,
                  height: 74,
                  decoration: ShapeDecoration(
                    color: const Color(0xC9DCDCDC),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 291,
                top: 21,
                child: CustomButton(myText: "Done", myTextColor: Colors.green, myBgColor: Colors.white, 
                onPressed: () {
                  
                },),
              ),
              Positioned(
                left: 13,
                top: 7,
                child: Text(
                  'TODO 1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Jockey One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Positioned(
                left: 13,
                top: 37,
                child: Text(
                  'Due Date : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Jockey One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
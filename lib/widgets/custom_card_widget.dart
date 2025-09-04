import 'package:flutter/material.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';

class CustomCardWidget extends StatelessWidget {
  final String task;
  final String duedate;

  const CustomCardWidget ({
    super.key, 
    required this.task, 
    required this.duedate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xC9DCDCDC),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  task,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Jockey One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Due Date : $duedate',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Jockey One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

          CustomButton(
            text: "Done",
            textColor: Colors.green,
            bgColor: Colors.white,
            onPressed: () {},
          ),


          ],
        ),
      ),
    );
  }
}
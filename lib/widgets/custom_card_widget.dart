import 'package:flutter/material.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';

class CustomCardWidget extends StatelessWidget {
  final String task;
  final String duedate;
  final String category;
  final Color categoryColor;
  final VoidCallback? onDone;
  final VoidCallback? onDelete;

  const CustomCardWidget({
    super.key,
    required this.task,
    required this.duedate,
    required this.category,
    required this.categoryColor,
    this.onDone,
    this.onDelete,
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
            // left: task + due
            Expanded(
              child: Column(
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
                    'Deskripsi : $duedate',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: 'Jockey One',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // category badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: categoryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // right: actions
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  text: 'Done',
                  textColor: Colors.white,
                  bgColor: Colors.green,
                  onPressed: onDone ?? () {},
                  height: 36,
                ),
                const SizedBox(height: 8),
                IconButton(
                  onPressed: onDelete ?? () {},
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String text;        // nama todo
  final String todo;        // deskripsi
  final String kategori;    // kategori todo
  final bool isCompleted;
  final VoidCallback onDone;
  final VoidCallback onDelete;

  const CustomCardWidget({
    super.key,
    required this.text,
    required this.todo,
    required this.kategori,
    required this.isCompleted,
    required this.onDone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onDone,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Leading icon (done/cancel)
              CircleAvatar(
                radius: 24,
                backgroundColor: Color(0xFF5CB3B3),
                child: Icon(
                  isCompleted ? Icons.check : Icons.cancel,
                  color: isCompleted ? Colors.white : Colors.red,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),

              // Main content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nama todo
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Deskripsi
                    if (todo.isNotEmpty)
                      Text(
                        todo,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),

                    const SizedBox(height: 8),

                    // Kategori Tag
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF5CB3B3).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        kategori,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF5CB3B3),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Delete button
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCardWidget extends StatelessWidget {
  final String namaTodo;
  final String deskripsiTodo;
  final String kategori;
  final bool isCompleted;
  final VoidCallback onDone;
  final VoidCallback onDelete;
  final DateTime? dueDate;
  final DateTime? completedAt;
  final DateTime? removedAt;

  const CustomCardWidget({
    super.key,
    required this.namaTodo,
    required this.deskripsiTodo,
    required this.kategori,
    required this.isCompleted,
    required this.onDone,
    required this.onDelete,
    this.dueDate,
    this.completedAt,
    this.removedAt,
  });

  String _formatDate(DateTime? dt) {
    if (dt == null) return "-";
    return DateFormat("d MMMM yyyy", "id_ID").format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          GestureDetector(
          onTap: onDone,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal, width: 2),
              borderRadius: BorderRadius.circular(6),
              color: isCompleted ? Colors.teal : Colors.transparent,
            ),
            child: isCompleted
                ? const Icon(Icons.check, size: 18, color: Colors.white)
                : null,
          ),
        ),
        const SizedBox(width: 14),

        // Main content
        Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
              namaTodo,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            const SizedBox(height: 4),
            if (deskripsiTodo.isNotEmpty)
        Text(
        deskripsiTodo,
        style: TextStyle(
          fontSize: 13,
          color: Colors.black87,
          decoration: isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      const SizedBox(height: 8),

      // Tags
      Wrap(
        spacing: 12,
        runSpacing: 4,
        children: [
          _buildTag(kategori, Colors.teal),
          if (dueDate != null) _buildTag("Due: ${_formatDate(dueDate)}", Colors.orange),
          if (isCompleted && completedAt != null)
            Text(
              "Done: ${DateFormat('d MMMM yyyy').format(completedAt!)}",
              style: const TextStyle(fontSize: 12, color: Colors.green),
            )
          else if (!isCompleted && removedAt != null)
            Text(
              "Removed: ${DateFormat('d MMMM yyyy').format(removedAt!)}",
              style: const TextStyle(fontSize: 12, color: Colors.red,
              ))],
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
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }
}

//p
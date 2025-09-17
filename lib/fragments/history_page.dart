import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/models/todo_model.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final TodoController todoController = Get.find<TodoController>();
  final Color mint = const Color(0xFF7FD6D6);
  final Color mintDark = const Color(0xFF5CB3B3);

  String _formatDate(DateTime? dt) {
    if (dt == null) return "-";
    return DateFormat("d MMMM yyyy, HH:mm", "id_ID").format(dt);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ===== Header Gradient =====
        Container(
          width: double.infinity,
          height: 140,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [mint, mintDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Riwayat Todo",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        // ===== List History =====
        Expanded(
          child: Obx(() {
            if (todoController.history.isEmpty) {
              return const Center(
                child: Text(
                  "Belum ada riwayat todo.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: todoController.history.length,
              itemBuilder: (context, index) {
                final TodoModel todo = todoController.history[index];
                final bool isCompleted = todo.completedAt != null;
                final bool isRemoved = todo.removedAt != null && !todo.isCompleted;

                final statusText = isCompleted
                    ? "Selesai pada ${_formatDate(todo.completedAt)}"
                    : "Dihapus pada ${_formatDate(todo.removedAt)}";

                final statusColor = isCompleted ? Colors.green : Colors.red;
                final statusIcon = isCompleted ? Icons.check_circle : Icons.cancel;

                return CustomCardWidget(
                  namaTodo: todo.namaTodo,
                  deskripsiTodo: todo.deskripsiTodo,
                  kategori: todo.kategoriTodo,
                  isCompleted: todo.isCompleted,
                  dueDate: todo.dueDate,
                  onDelete: () => todoController.deleteTodo(index),
                  onDone: () => todoController.toggleCompleted(index),
                );              },
            );
          }),
        ),
      ],
    );
  }
}

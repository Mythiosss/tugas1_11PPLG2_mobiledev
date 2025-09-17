import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/models/todo_model.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  final TodoController c = Get.find<TodoController>();

  final Color mint = const Color(0xFF7FD6D6);
  final Color mintDark = const Color(0xFF5CB3B3);

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
            if (c.history.isEmpty) {
              return const Center(
                child: Text(
                  "Belum ada riwayat todo.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: c.history.length,
              itemBuilder: (context, index) {
                final TodoModel todo = c.history[index];

                return CustomCardWidget(
                  namaTodo: todo.namaTodo,
                  deskripsiTodo: todo.deskripsiTodo,
                  kategori: todo.kategoriTodo,
                  isCompleted: todo.isCompleted,
                  dueDate: todo.dueDate,
                  completedAt: todo.completedAt,
                  removedAt: todo.removedAt,
                  onDelete: () => c.deleteTodo(index),
                  onDone: () => c.toggleCompleted(index),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}

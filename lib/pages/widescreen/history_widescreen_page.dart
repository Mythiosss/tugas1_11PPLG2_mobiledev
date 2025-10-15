import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HistoryWidescreen extends StatelessWidget {
  HistoryWidescreen({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Container(
              width: double.infinity,
              color: const Color(0xFF7FD6D6),
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Obx(() => Text(
                        "${todoController.history.length} History",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Obx(() {
                if (todoController.history.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.history, size: 80, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      const Text(
                        "Belum ada history.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  );
                }

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: todoController.history.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.history[index];
                    return CustomCardWidget(
                      namaTodo: todo.namaTodo,
                      deskripsiTodo: todo.deskripsiTodo,
                      kategori: todo.kategoriTodo,
                      isCompleted: todo.isCompleted,
                      dueDate: todo.dueDate,
                      completedAt: todo.completedAt,
                      removedAt: todo.removedAt,
                      onDelete: () => todoController.deleteTodo(index),
                      onDone: () => todoController.toggleCompleted(index),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
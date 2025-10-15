import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/routes/routes.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HomeWidescreen extends StatelessWidget {
  HomeWidescreen({super.key});

  final TodoController todoController = Get.find<TodoController>();

  final mint = const Color(0xFF7FD6D6);
  final mintDark = const Color(0xFF5CB3B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 144,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Du-Itin!",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Halo, Mythios!",
                            style: TextStyle(fontSize: 16, color: Colors.white70),
                          ),
                        ],
                      ),
                      Obx(() => Text(
                            "${todoController.todos.length} Todo",
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
              const Positioned(
                bottom: -28,
                left: 48,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: Color(0xFF5CB3B3)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 46),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Obx(() {
                if (todoController.todos.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox_outlined, size: 80, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      const Text(
                        "Belum ada todo di list-mu.",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5CB3B3),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        onPressed: () => Get.toNamed(AppRoutes.addTodo),
                        icon: const Icon(Icons.add, color: Colors.white),
                        label: const Text(
                          'Tambah Todo',
                          style: TextStyle(color: Colors.white),
                        ),
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
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todos[index];
                    return CustomCardWidget(
                      namaTodo: todo.namaTodo,
                      deskripsiTodo: todo.deskripsiTodo,
                      kategori: todo.kategoriTodo,
                      isCompleted: todo.isCompleted,
                      dueDate: todo.dueDate,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF5CB3B3),
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        tooltip: 'Tambah Todo',
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/routes/routes.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.put(TodoController());

  final mint = const Color(0xFF7FD6D6);
  final mintDark = const Color(0xFF5CB3B3);
  final cardBg = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          // HEADER
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 180,
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
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                  child: Column(
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
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -28,
                left: MediaQuery.of(context).size.width / 2 - 28,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 32, color: mintDark),
                ),
              ),
            ],
          ),

          const SizedBox(height: 46),

          // BODY
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() {
                if (todoController.todos.isEmpty) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum ada todo di list-mu.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        text: 'Tambah Todo',
                        textColor: Colors.white,
                        bgColor: mintDark,
                        onPressed: () {
                          Get.toNamed(AppRoutes.addTodo);
                        },
                      ),
                    ],
                  );
                }

                return ListView.builder(
                  itemCount: todoController.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoController.todos[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CustomCardWidget(
                        task: todo.namaTodo,
                        duedate: todo.deskripsiTodo,
                        category: todo.kategoriTodo,
                        categoryColor: todoController.getCategoryColor(todo.kategoriTodo),
                        onDone: () => todoController.toggleCompleted(index),
                        onDelete: () => todoController.deleteTodo(index),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mintDark,
        onPressed: () {
          Get.toNamed(AppRoutes.addTodo);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
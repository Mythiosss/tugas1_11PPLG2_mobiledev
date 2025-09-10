import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';
import 'package:tugas_flutter_1/widgets/custom_button.dart';
import 'package:tugas_flutter_1/routes/routes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  final Color bg = const Color(0xFFF5F5F5);
  final Color mint = const Color(0xFF7FD6D6);
  final Color mintDark = const Color(0xFF5CB3B3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [

            Stack(
              clipBehavior: Clip.none,
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
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Du-Itin!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Halo, Mythios!',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  bottom: -36,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white70, width: 2.5),
                      ),
                      child: const Center(
                        child: Icon(Icons.person, color: Colors.white, size: 36),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 46),


            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: ListView(
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'My Todos',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () => Get.toNamed(AppRoutes.addTodo),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: mint,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Obx(() {
                              final todos = todoController.todos;
                              if (todos.isEmpty) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Belum ada todo di list-mu.",
                                        style: TextStyle(fontSize: 14, color: Colors.black54),
                                      ),
                                      const SizedBox(height: 12),
                                      SizedBox(
                                        width: double.infinity,
                                        child: CustomButton(
                                          text: 'Tambah Todo',
                                          textColor: Colors.white,
                                          bgColor: mintDark,
                                          onPressed: () => Get.toNamed(AppRoutes.addTodo),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }

                              return Column(
                                children: List.generate(todos.length, (index) {
                                  final todo = todos[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: CustomCardWidget(
                                      task: todo.namaTodo,
                                      duedate: todo.deskripsiTodo,
                                      category: todo.kategoriTodo,
                                      categoryColor:
                                      todoController.getCategoryColor(todo.kategoriTodo),
                                      onDone: () => todoController.toggleCompleted(index),
                                      onDelete: () => todoController.deleteTodo(index),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.grey.shade200),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              Get.snackbar('Info', 'History belum diimplementasi',
                                  snackPosition: SnackPosition.BOTTOM);
                            },
                            child: const Text('History'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: mintDark,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () => Get.toNamed(AppRoutes.addTodo),
                            child: const Text('Add Todo', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: mintDark,
        onPressed: () => Get.toNamed(AppRoutes.addTodo),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

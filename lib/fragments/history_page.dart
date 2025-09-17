import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HistoryPage extends StatelessWidget {


  HistoryPage({super.key});

  final TodoController todoController = Get.find<TodoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  'History',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), Expanded(
                  child: ListView.builder(
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
                  )
              )
            ]
        ));
  }
}
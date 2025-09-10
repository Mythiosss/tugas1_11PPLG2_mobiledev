import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/widgets/custom_card_widget.dart';

class HistoryPage extends StatelessWidget {
  

  HistoryPage({super.key});

  final TodoController todoController = Get.find<TodoController>();
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoController.history.length,
      itemBuilder: (context, index) {
        final todo = todoController.history[index];
        return CustomCardWidget(
          text: todo.namaTodo,
          todo: todo.deskripsiTodo,
          kategori: todo.kategoriTodo,
          isCompleted: todo.isCompleted,
          onDelete: () => todoController.deleteTodo(index),
          onDone: () => todoController.toggleCompleted(index),
        );
      },
    );
  }
}
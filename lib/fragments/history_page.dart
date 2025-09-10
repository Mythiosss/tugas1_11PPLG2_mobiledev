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
          bgcolor: todoController.getCategoryColor(todo.kategoriTodo), 
          text: todo.namaTodo, 
          todo: todo.deskripsiTodo,
          iconDel: Icon(Icons.delete), 
          iconDone: Icon(todo.isCompleted ? Icons.check : Icons.cancel, color: todo.isCompleted ? Colors.white : Colors.red), 
          onDelete: () => todoController.deleteTodo(index), 
          onDone: () => todoController.toggleCompleted(index), 
        );
      },
    );
  }
}
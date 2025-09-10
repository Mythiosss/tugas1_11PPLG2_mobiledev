import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_1/models/todo_model.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;
  var history = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    todos.addAll([
      TodoModel(
        namaTodo: "Tugas Pak aji",
        deskripsiTodo: "Flutter TodoListApp, ACC DONG PAK HEHE",
        kategoriTodo: "Sekolah",
      ),
      TodoModel(
        namaTodo: "Beli Gula",
        deskripsiTodo: "abis maen game ya",
        kategoriTodo: "Pribadi",
      ),
      TodoModel(
        namaTodo: "Makan",
        deskripsiTodo: "nanti",
        kategoriTodo: "Pribadi",
      ),
    ]);
  }

  void toggleCompleted(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
    todos.refresh();
  }
  final Map<String, Color> categoryColors = {
    "Sekolah": Color(0xFF7FD6D6),
    "Pribadi": Color(0xFF6FD2C2),
    "Pekerjaan": Color(0xFF4DB6AC),
  };

  Color getCategoryColor(String kategori) {
    return categoryColors[kategori] ?? Colors.grey;
  }

  void deleteTodo(int index) {
    history.add(todos[index]);
    todos[index].completedAt = DateTime.now();
    todos.removeAt(index);
  }
}

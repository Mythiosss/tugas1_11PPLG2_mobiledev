import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final RxList<TodoModel> todos = <TodoModel>[].obs;
  final RxList<TodoModel> history = <TodoModel>[].obs;

  static const Map<String, Color> _categoryColors = {
    "Sekolah": Color(0xFF7FD6D6),
    "Pribadi": Color(0xFF6FD2C2),
    "Pekerjaan": Color(0xFF4DB6AC),
  };

  @override
  void onInit() {
    super.onInit();
    // Pastikan dummy cuma ditambahkan kalau list masih kosong
    if (todos.isEmpty) {
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
    // debug: cek onInit dipanggil dan length
    // print('TodoController onInit - hash=${this.hashCode} - todos=${todos.length}');
  }

  Color getCategoryColor(String kategori) {
    return _categoryColors[kategori] ?? Colors.grey;
  }

  void addTodo(TodoModel todo) {
    todos.add(todo);
  }

  void toggleCompleted(int index) {
    if (index < 0 || index >= todos.length) return;
    final current = todos[index];
    current.isCompleted = !current.isCompleted;
    current.isCompleted ? current.completedAt = DateTime.now() : current.completedAt = null;
    todos.refresh();
  }

  void deleteTodo(int index) {
    if (index < 0 || index >= todos.length) return;
    final removed = todos.removeAt(index);
    removed.completedAt = DateTime.now();
    history.add(removed);
    todos.refresh();
    history.refresh();
  }
}

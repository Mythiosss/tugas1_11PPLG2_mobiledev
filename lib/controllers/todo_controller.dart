import 'package:get/get.dart';
import 'package:tugas_flutter_1/db_helper.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final RxList<TodoModel> todos = <TodoModel>[].obs;
  final RxList<TodoModel> history = <TodoModel>[].obs;
  final DBHelper _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
    loadHistory();
  }

  // Load data dari database
  Future<void> loadTodos() async {
    final loadedTodos = await _dbHelper.getTodos();
    
    // Jika kosong, tambahkan data default
    if (loadedTodos.isEmpty) {
      final defaultTodos = [
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
      ];
      
      for (var todo in defaultTodos) {
        await _dbHelper.insertTodo(todo);
      }
      
      todos.value = await _dbHelper.getTodos();
    } else {
      todos.value = loadedTodos;
    }
  }

  Future<void> loadHistory() async {
    history.value = await _dbHelper.getHistory();
  }

  Future<void> addTodo(TodoModel todo) async {
    final id = await _dbHelper.insertTodo(todo);
    todo.id = id;
    todos.add(todo);
  }

  Future<void> toggleCompleted(int index) async {
    if (index < 0 || index >= todos.length) return;
    
    final current = todos[index];
    current.isCompleted = !current.isCompleted;
    current.completedAt = current.isCompleted ? DateTime.now() : null;
    
    await _dbHelper.updateTodo(current);
    todos.refresh();
  }

  Future<void> deleteTodo(int index) async {
    if (index < 0 || index >= todos.length) return;

    final removed = todos[index];
    
    // Hapus dari database todos
    if (removed.id != null) {
      await _dbHelper.deleteTodo(removed.id!);
    }

    // Tambahkan ke history
    if (removed.isCompleted) {
      removed.completedAt = DateTime.now();
    } else {
      removed.removedAt = DateTime.now();
    }
    
    await _dbHelper.insertHistory(removed);
    
    todos.removeAt(index);
    await loadHistory();
    
    todos.refresh();
    history.refresh();
  }
}
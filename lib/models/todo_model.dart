class TodoModel {
  final String namaTodo;
  final String deskripsiTodo;
  final String kategoriTodo;
  bool isCompleted;
  DateTime? completedAt;

  TodoModel({
    required this.namaTodo,
    required this.deskripsiTodo,
    required this.kategoriTodo,
    this.isCompleted = false,
    this.completedAt
  });
}
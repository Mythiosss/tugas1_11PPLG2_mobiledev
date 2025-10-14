class TodoModel {
  int? id; // Tambahkan id untuk database
  String namaTodo;
  String deskripsiTodo;
  String kategoriTodo;
  DateTime? dueDate;
  bool isCompleted;
  DateTime? completedAt;
  DateTime? removedAt;

  TodoModel({
    this.id,
    required this.namaTodo,
    required this.deskripsiTodo,
    required this.kategoriTodo,
    this.dueDate,
    this.isCompleted = false,
    this.completedAt,
    this.removedAt,
  });

  // Konversi ke Map untuk SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'namaTodo': namaTodo,
      'deskripsiTodo': deskripsiTodo,
      'kategoriTodo': kategoriTodo,
      'dueDate': dueDate?.millisecondsSinceEpoch,
      'isCompleted': isCompleted ? 1 : 0,
      'completedAt': completedAt?.millisecondsSinceEpoch,
      'removedAt': removedAt?.millisecondsSinceEpoch,
    };
  }

  // Konversi dari Map SQLite
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      namaTodo: map['namaTodo'],
      deskripsiTodo: map['deskripsiTodo'],
      kategoriTodo: map['kategoriTodo'],
      dueDate: map['dueDate'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['dueDate']) 
          : null,
      isCompleted: map['isCompleted'] == 1,
      completedAt: map['completedAt'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['completedAt']) 
          : null,
      removedAt: map['removedAt'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['removedAt']) 
          : null,
    );
  }
}
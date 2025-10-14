import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/todo_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();
  factory DBHelper() => _instance;
  DBHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'todos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE todos(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            namaTodo TEXT,
            deskripsiTodo TEXT,
            kategoriTodo TEXT,
            dueDate INTEGER,
            isCompleted INTEGER,
            completedAt INTEGER,
            removedAt INTEGER
          )''',
        );
        
        await db.execute(
          '''CREATE TABLE history(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            namaTodo TEXT,
            deskripsiTodo TEXT,
            kategoriTodo TEXT,
            dueDate INTEGER,
            isCompleted INTEGER,
            completedAt INTEGER,
            removedAt INTEGER
          )''',
        );
      },
    );
  }

  // CRUD untuk Todos
  Future<int> insertTodo(TodoModel todo) async {
    final client = await db;
    return await client.insert('todos', todo.toMap());
  }

  Future<List<TodoModel>> getTodos() async {
    final client = await db;
    final List<Map<String, dynamic>> maps = await client.query('todos');
    return List.generate(maps.length, (i) => TodoModel.fromMap(maps[i]));
  }

  Future<int> updateTodo(TodoModel todo) async {
    final client = await db;
    return await client.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final client = await db;
    return await client.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CRUD untuk History
  Future<int> insertHistory(TodoModel todo) async {
    final client = await db;
    return await client.insert('history', todo.toMap());
  }

  Future<List<TodoModel>> getHistory() async {
    final client = await db;
    final List<Map<String, dynamic>> maps = await client.query('history');
    return List.generate(maps.length, (i) => TodoModel.fromMap(maps[i]));
  }

  Future<int> deleteHistory(int id) async {
    final client = await db;
    return await client.delete(
      'history',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
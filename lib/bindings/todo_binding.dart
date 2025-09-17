import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/add_todo_controller.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController(), fenix: true);
    Get.lazyPut<AddTodoController>(() => AddTodoController(), fenix: true);
  }
}
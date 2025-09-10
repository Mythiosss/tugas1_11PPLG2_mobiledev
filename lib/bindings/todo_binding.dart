import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/add_todo_controller.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';
import 'package:tugas_flutter_1/controllers/bottom_nav_controller.dart';
import 'package:tugas_flutter_1/controllers/todo_controller.dart';
import 'package:tugas_flutter_1/pages/bottom_nav.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<TodoController>(() => TodoController());
    Get.lazyPut<AddTodoController>(() => AddTodoController());
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
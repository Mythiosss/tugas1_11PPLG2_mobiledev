import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
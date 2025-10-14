import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/auth_controller.dart';
import 'package:tugas_flutter_1/controllers/responsive_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());

  }
}

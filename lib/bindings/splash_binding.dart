import 'package:get/get.dart';
import 'package:tugas_flutter_1/controllers/splashscreen_controller.dart';

class Splashbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController(), fenix: true);
  }
}
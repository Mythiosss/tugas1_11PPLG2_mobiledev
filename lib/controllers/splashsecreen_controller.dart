import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_flutter_1/routes/routes.dart';

class SplashscreenController extends GetxController {


  
  @override
  void onInit() {
    checklogin();
    super.onInit();
  }

  checklogin() async{
    final prefs = await SharedPreferences.getInstance();
    
    if (prefs.getString("username") != null) {
      await Future.delayed(Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.mainMenuPage);
    }
    else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
  }
}
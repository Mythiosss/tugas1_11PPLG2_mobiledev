
import 'package:get/get.dart';
import 'package:tugas_flutter_1/fragments/profile_page.dart';
import 'package:tugas_flutter_1/fragments/login_page.dart';
import 'package:tugas_flutter_1/routes/routes.dart';

class AppPages {
  static final pages =[
    // GetPage(name: AppRoutes.mainMenuPage, page: ()=> MainMenuPage()),
    // GetPage(name: AppRoutes.historyPage, page: ()=> Historypage()),
    // GetPage(name: AppRoutes.todoPage, page: ()=> TodoPage()),
    GetPage(name: AppRoutes.loginPage, page: ()=> LoginPage()),
    GetPage(name: AppRoutes.profilePage, page: ()=> ProfilePage()),
  ];
} 

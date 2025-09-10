
import 'package:get/get.dart';
import 'package:tugas_flutter_1/fragments/add_todo_page.dart';
import 'package:tugas_flutter_1/fragments/history_page.dart';
import 'package:tugas_flutter_1/fragments/home_page.dart';
import 'package:tugas_flutter_1/fragments/profile_page.dart';
import 'package:tugas_flutter_1/fragments/login_page.dart';
import 'package:tugas_flutter_1/pages/bottom_nav.dart';
import 'package:tugas_flutter_1/routes/routes.dart';

class AppPages {
  static final pages =[
    GetPage(name: AppRoutes.mainMenuPage, page: ()=> BottomNav()),
    GetPage(name: AppRoutes.historyPage, page: ()=> HistoryPage()),
    GetPage(name: AppRoutes.homePage, page: ()=> HomePage()),
    GetPage(name: AppRoutes.loginPage, page: ()=> LoginPage()),
    GetPage(name: AppRoutes.profilePage, page: ()=> ProfilePage()),
    GetPage(name: AppRoutes.addTodo, page: ()=> AddTodoPage()),
  ];
} 

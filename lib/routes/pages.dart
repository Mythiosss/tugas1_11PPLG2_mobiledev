// lib/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:tugas_flutter_1/fragments/login_page.dart';
// import 'package:tugas_flutter_1/pages/main_menu_page.dart';
// import 'package:tugas_flutter_1/pages/history_page.dart';
// import 'package:tugas_flutter_1/pages/todo_page.dart';
// import 'package:tugas_flutter_1/pages/profile_page.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    // GetPage(name: AppRoutes.mainMenuPage, page: () => MainMenuPage()),
    // GetPage(name: AppRoutes.historyPage, page: () => HistoryPage()),
    // GetPage(name: AppRoutes.todoPage, page: () => TodoPage()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage()),
    // GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
  ];
}

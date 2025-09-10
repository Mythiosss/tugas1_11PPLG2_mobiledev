import 'package:get/get.dart';
import '../bindings/todo_binding.dart';
import '../fragments/home_page.dart';
import '../fragments/add_todo_page.dart';
import '../fragments/history_page.dart';
import '../fragments/profile_page.dart';
import '../fragments/login_page.dart';
import '../pages/bottom_nav.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.mainMenuPage, page: () => BottomNav(), binding: TodoBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryPage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.addTodo, page: () => AddTodoPage(), binding: TodoBinding()),
  ];
}

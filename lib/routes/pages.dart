import 'package:get/get.dart';
import 'package:tugas_flutter_1/bindings/auth_binding.dart';
import 'package:tugas_flutter_1/bindings/bottom_nav_binding.dart';
import 'package:tugas_flutter_1/fragments/splashscreen_page.dart';
import 'package:tugas_flutter_1/pages/add_todo_page.dart';
import 'package:tugas_flutter_1/pages/amir_profile.dart';
import 'package:tugas_flutter_1/pages/responsive/amir_profile_responsive.dart';
import 'package:tugas_flutter_1/pages/responsive/home_responsive.dart';
import 'package:tugas_flutter_1/pages/responsive/login_responsive.dart';
import 'package:tugas_flutter_1/pages/sharlyf_profile.dart';
import 'package:tugas_flutter_1/pages/widescreen/history_widescreen_page.dart';
import 'package:tugas_flutter_1/pages/widescreen/home_widescreen_page.dart';
import '../bindings/todo_binding.dart';
import '../fragments/home_page.dart';
import '../fragments/history_page.dart';
import '../fragments/profile_page.dart';
import '../pages/login_page.dart';
import '../pages/bottom_nav.dart';
import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.mainMenuPage, page: () => BottomNav(), binding: BottomNavBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomePage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.homePage, page: () => HomeWidescreen(), binding: TodoBinding()),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryPage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.historyPage, page: () => HistoryWidescreen(), binding: TodoBinding()),
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.addTodo, page: () => AddTodoPage(), binding: TodoBinding()),
    GetPage(name: AppRoutes.sharlyfPage, page: () => SharlyfProfilePage()),
    GetPage(name: AppRoutes.amirPage, page: () => AmirProfilePage()),
    GetPage(name: AppRoutes.splashPage, page: () => SplashscreenPage()),
    GetPage(name: AppRoutes.loginResponsive, page: () => LoginResponsive(), binding: AuthBinding()),
    GetPage(name: AppRoutes.amirResponsive, page: () => AmirProfileResponsive(), binding: AuthBinding()),
    GetPage(name: AppRoutes.sharlyfResponsive, page: () => SharlyfProfileResponsive(), binding: AuthBinding()),
  ];
}
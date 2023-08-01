import 'package:get/get.dart';
import 'package:to_do_app/src/presentation/pages/add_todo_page.dart';
import 'package:to_do_app/src/presentation/pages/main_page.dart';
import 'package:to_do_app/src/presentation/pages/initial_page.dart';
part './routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const InitialPage(),
      transition: Transition.fade,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const MainPage(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.ADDTODO,
      page: () => const AddTodo(),
      transition: Transition.rightToLeft,
    )
  ];
}

// ignore_for_file: constant_identifier_names
import 'package:get/get.dart';
import 'package:to_do_app/src/presentation/pages/edit_todo_page.dart';
import 'package:to_do_app/src/presentation/pages/main_page.dart';
import 'package:to_do_app/src/presentation/pages/initial_page.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const EDITTODO = '/editTodo/';
  static final EdiTodo_W_PARAMS = '/editTodo/:id';
}

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
      name: Routes.EDITTODO,
      page: () => const TodoEdit(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.EdiTodo_W_PARAMS,
      page: () => TodoEdit(
        todoId: Get.parameters['id'],
      ),
      transition: Transition.rightToLeft,
    ),
  ];
}

import 'package:get/get.dart';
import 'package:to_do_app/src/data/repository/todos_repository_impl.dart';
import 'package:to_do_app/src/data/source/storage/controller.dart';

class TodosController extends GetxController {
  final Rx<TodosRepositoryImpl> todosController =
      TodosRepositoryImpl(Get.put(DatabaseController()).database.value).obs;
}

import 'package:get/get.dart';
import '../../data/repository/controller.dart';
import 'delete_todo.dart';
import 'delete_todo_impl.dart';
import 'get_todo.dart';
import 'get_todo_impl.dart';
import 'get_todos.dart';
import 'get_todos_impl.dart';
import 'save_todo.dart';
import 'save_todo_impl.dart';

class UseCaseController extends GetxController {
  final Rx<GetTodosUseCase> getTodosController =
      GetTodosUseCaseImpl(Get.put(TodosController()).todosController.value)
          .obs;

  final Rx<GetTodoUseCase> getTodoController =
      GetTodoUseCaseImpl(Get.put(TodosController()).todosController.value)
          .obs;

  final Rx<SaveTodoUseCase> saveTodoUseCase =
      SaveTodoUseCaseImpl(Get.put(TodosController()).todosController.value)
          .obs;

  final Rx<DeleteTodoUseCase> deleteTodoUseCase =
      DeleteTodoUseCaseImpl(Get.put(TodosController()).todosController.value)
          .obs;
}

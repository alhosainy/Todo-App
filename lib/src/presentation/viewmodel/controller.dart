import 'package:get/get.dart';
import '../../domain/models/todo.dart';
import '../../domain/models/todos.dart';
import '../../domain/usecases/controller.dart';

class ListController extends GetxController {
  final Rx<Todos> todosList = const Todos(todos: []).obs;
  final UseCaseController todosListController =
      Get.put<UseCaseController>(UseCaseController());
  getTodos() async {
    todosList.value = await todosListController.getTodosController.value.call();
    todosList.refresh();
  }

  Future<void> save(Todo todo) async {
    await todosListController.saveTodoUseCase.value.call(todo);
    await getTodos();
  }
}

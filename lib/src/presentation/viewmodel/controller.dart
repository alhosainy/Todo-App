import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/models/todo.dart';
import '../../domain/models/todos.dart';
import '../../domain/usecases/controller.dart';

class ViewModelController extends GetxController {
  static var logger = Logger().obs;

  final Rx<Todos> todosList = Todos(todos: []).obs;
  final UseCaseController todosListController =
      Get.put<UseCaseController>(UseCaseController());
  final RxList<Todo> activeTodos = <Todo>[].obs;
  final RxList<Todo> completedTodos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTodos();
  }

  getTodos() async {
    todosList.value = await todosListController.getTodosController.value.call();
    activeTodos.value = todosList.value.unCompleted;
    completedTodos.value = todosList.value.completed;
    activeTodos.refresh();
    completedTodos.refresh();
    todosList.refresh();
  }

  Future<void> save(Todo todo) async {
    await todosListController.saveTodoUseCase.value.call(todo);

    // await getTodos();
  }

  Future<Todo?> getTodo(String id) async {
    return await todosListController.getTodoController.value.call(id);
  }

  Future<void> deleteTodo(String todoId) async {
    await todosListController.deleteTodoUseCase.value.call(todoId);
    await getTodos();
  }

  Future<void> deleteAllTodos() async {
    await todosListController.deleteAllTodos.value.call();
    await getTodos();
  }
}

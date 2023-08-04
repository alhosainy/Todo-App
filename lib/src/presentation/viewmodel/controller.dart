import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../domain/models/todo.dart';
import '../../domain/models/todos.dart';
import '../../domain/usecases/controller.dart';

class ViewModelController extends GetxController {
  var logger = Logger().obs;

  final Rx<Todos> todosList = const Todos(todos: []).obs;
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
    todosList.refresh();
  }

  Future<void> save(Todo todo) async {
    await todosListController.saveTodoUseCase.value.call(todo);
    await getTodos();
  }

  Future<Todo?> getTodo(String id) async {
    return await todosListController.getTodoController.value.call(id);
  }

  // RxList<Todo> get unCompletedTodos => todosList.value.unCompleted.obs;

  // RxList<Todo> get completedTodos => todosList.value.completed.obs;
}

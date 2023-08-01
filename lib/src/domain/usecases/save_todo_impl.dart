import '../models/todo.dart';
import '../repository/todos_repository.dart';
import 'save_todo.dart';

class SaveTodoUseCaseImpl extends SaveTodoUseCase {
  SaveTodoUseCaseImpl(this.repository);
  final TodosRepository repository;
  @override
  Future<void> call(Todo todo) async {
    await repository.saveTodo(todo);
  }
}

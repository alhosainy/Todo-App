import '../models/todo.dart';
import '../repository/todos_repository.dart';
import 'delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this.repository);
  final TodosRepository repository;
  @override
  Future<void> call(Todo todo) async {
    await repository.deleteTodo(todo);
  }
}

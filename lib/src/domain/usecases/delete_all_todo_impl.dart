import '../repository/todos_repository.dart';
import 'delete_all_todos.dart';

class DeleteAllTodosImpl extends DeleteAllTodos {
  DeleteAllTodosImpl(this.repository);
  final TodosRepository repository;

  @override
  Future<void> call() {
    return repository.deleteAllTodos();
  }
}

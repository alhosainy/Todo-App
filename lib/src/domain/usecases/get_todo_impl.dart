import '../models/todo.dart';
import '../repository/todos_repository.dart';
import 'get_todo.dart';

class GetTodoUseCaseImpl extends GetTodoUseCase {
  GetTodoUseCaseImpl(this.repository);
  final TodosRepository repository;
  @override
  Future<Todo?> call(String id) async {
    return await repository.getTodoById(id);
  }
}

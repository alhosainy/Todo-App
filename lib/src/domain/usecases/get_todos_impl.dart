import '../models/todos.dart';
import '../repository/todos_repository.dart';
import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.repository);
  final TodosRepository repository;

  @override
  Future<Todos> call() async {
    return await repository.loadTodos();
  }
  
}

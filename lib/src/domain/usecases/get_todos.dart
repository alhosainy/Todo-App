import '../models/todos.dart';

abstract class GetTodosUseCase {
  Future<Todos> call();
}

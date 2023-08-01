import '../models/todo.dart';

abstract class GetTodoUseCase {
  Future<Todo?> call(String id);
}

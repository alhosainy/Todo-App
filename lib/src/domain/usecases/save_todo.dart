import '../models/todo.dart';

abstract class SaveTodoUseCase {
  Future<void> call(Todo todo);
}

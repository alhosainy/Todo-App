import '../models/todo.dart';

abstract class DeleteTodoUseCase {
  Future<void> call(Todo todo);
}

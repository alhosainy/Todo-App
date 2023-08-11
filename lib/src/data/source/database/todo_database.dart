import '../../../domain/models/todo.dart';
import '../../../domain/models/todos.dart';

abstract class TodoDatabaseController {
  Future openDb();
  Future<int> insertTodo(Todo todo);
  Future<Todos?> getAllTodos();
  Future<Todo?> getTodoById(String todoId);
  Future<void> deleteTodo(String todoId);
  Future<void> deleteAllTodos();
  Future<void> updateTodo(Todo todo);
  Future close();
}

import '../models/todo.dart';
import '../models/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteAllTodos();


  Future<void> deleteTodoById(String todoId);

  Future<Todo?> getTodoById(String todoId);
}

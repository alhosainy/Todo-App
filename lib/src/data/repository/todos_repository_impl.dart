import '../../domain/models/todo.dart';
import '../../domain/models/todos.dart';
import '../../domain/repository/todos_repository.dart';
import '../source/database/todo_database.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.database);

  final TodoDatabaseController database;

  @override
  Future<void> deleteAllTodos() async {
    await database.deleteAllTodos();
  }

  @override
  Future<void> deleteTodoById(String todoId) {
    return database.deleteTodo(todoId);
  }

  @override
  Future<Todo?> getTodoById(String todoId) async {
    return await database.getTodoById(todoId);
  }

  @override
  Future<Todos> loadTodos() async {
    final todos = await database.getAllTodos() ?? Todos(todos: []);
    return todos;
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    database.insertTodo(todo);
  }

  Future openDB() async {
    await database.openDb();
  }
}

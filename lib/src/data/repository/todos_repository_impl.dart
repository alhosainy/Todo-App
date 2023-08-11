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
    await database.openDb();

    final content = await database.getAllTodos();
    if (content == null) return Todos(todos: []);
    return content;
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    await database.openDb();
    database.insertTodo(todo);
  }
}

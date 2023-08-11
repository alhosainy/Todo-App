import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:to_do_app/src/domain/models/todo.dart';

import 'package:to_do_app/src/domain/models/todos.dart';

import '../../domain/repository/todos_repository.dart';
import '../source/database/todo_database.dart';
import '../source/storage/controller.dart';
import '../source/storage/files.dart';

// class TodosRepositoryImpl extends TodosRepository {
//   TodosRepositoryImpl(this.files);
//   final Files files;
//   late final String path = 'todos.json';

//   @override
//   Future<Todos> loadTodos() async {
//     final content = await files.read(path);
//     if (content == null) return Todos(todos: []);
//     return Todos.fromJson(jsonDecode(content));
//   }

//   @override
//   Future<void> deleteAllTodos() async {
//     files.delete(path);
//   }

//   @override
//   Future<void> deleteTodoById(String todoId) async {
//     final todos = await loadTodos();
//     final newTodos =
//         todos.todos.where((todo) => todo.todoId != todoId).toList();
//     await files.write(path, jsonEncode(Todos(todos: newTodos).toJson()));
//     // todos.todos.removeWhere((todo) => todo.id == id);
//     // await files.write(path, jsonEncode(todos.todos));
//   }

//   @override
//   Future<void> saveTodo(Todo todo) async {
//     final todos = await loadTodos();
//     final newTodos =
//         todos.todos.where((element) => element.todoId != todo.todoId).toList();
//     newTodos.add(todo);
//     await files.write(path, jsonEncode(Todos(todos: newTodos).toJson()));
//   }

//   @override
//   Future<Todo?> getTodoById(String todoId) async {
//     final todos = await loadTodos();
//     return todos.todos.firstWhereOrNull((todo) => todo.todoId == todoId);
//   }
// }
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

import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:to_do_app/src/domain/models/todo.dart';

import 'package:to_do_app/src/domain/models/todos.dart';

import '../../domain/repository/todos_repository.dart';
import '../source/storage/files.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.files);
  final Files files;
  late final String path = 'todos.json';

  @override
  Future<Todos> loadTodos() async {
    final content = await files.read(path);
    if (content == null) return const Todos(todos: []);
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<void> deleteAllTodos() async {
    files.delete(path);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();
    final newTodos = todos.todos.where((t) => t.id != todo.id);
    await files.write(path, jsonEncode(newTodos));
  }

  @override
  Future<void> deleteTodoById(String id) async {
    final todos = await loadTodos();
    todos.todos.removeWhere((todo) => todo.id == id);
    await files.write(path, jsonEncode(todos.todos));
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();
    final newTodos =
        todos.todos.where((element) => element.id != todo.id).toList();
    newTodos.add(todo);
    await files.write(path, jsonEncode(Todos(todos: newTodos).toJson()));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();
    return todos.todos.firstWhereOrNull((todo) => todo.id == id);
  }
}

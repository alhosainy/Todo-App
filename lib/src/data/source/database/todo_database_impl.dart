import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'todo_database.dart';

import '../../../domain/models/todo.dart';
import '../../../domain/models/todos.dart';

const String tableTodo = 'todo';
const String columnId = '_id';
const String columntodoId = 'todoId';
const String columnTitle = 'title';
const String columnDescription = 'description';
const String columnCompleted = 'completed';

class TodoDatabaseControllerImpl extends TodoDatabaseController {
  late Database db;

  @override
  Future close() async => await db.close();

  @override
  Future<void> deleteAllTodos() async {
    await db.delete(tableTodo);
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await db.delete(tableTodo, where: '$columntodoId = ?', whereArgs: [todoId]);
  }

  @override
  Future<Todos?> getAllTodos() async {
    final todos = await db.rawQuery('SELECT * FROM todo');
    final newTodos = todos.map((todo) {
      final completed = todo['completed'] == 1 ? true : false;
      return Todo.fromJson({...todo, 'completed': completed});
    }).toList();
    return Todos(todos: newTodos);
  }

  @override
  Future<Todo?> getTodoById(String todoId) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columntodoId, columnCompleted, columnTitle],
        where: '$columntodoId = ?',
        whereArgs: [todoId]);
    if (maps.isNotEmpty) {
      final todoMap = maps.first as Map<String, dynamic>;
      final completed = todoMap['completed'] == 1 ? true : false;

      return Todo.fromJson({...todoMap, 'completed': completed});
    }
    return null;
  }

  @override
  Future<int> insertTodo(Todo todo) async {
    await openDb();
    final todos = await db.query(tableTodo,
        columns: [columnId, columntodoId, columnCompleted, columnTitle],
        where: '$columntodoId = ?',
        whereArgs: [todo.todoId]);

    if (todos.isNotEmpty) {
      for (final _ in todos) {
        await deleteTodo(todo.todoId);
      }
    }

    final todoMap = todo.toJson();
    todoMap['completed'] == true
        ? todoMap['completed'] = 1
        : todoMap['completed'] = 0;
    return await db.insert(tableTodo, todoMap);
  }

  @override
  Future openDb() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'todo.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columntodoId text not null,
  $columnTitle text not null,
  $columnDescription text not null,
  $columnCompleted integer not null)
''');
    });
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    await db.update(tableTodo, todo.toJson(),
        where: '$columntodoId = ?', whereArgs: [todo.todoId]);
  }
}

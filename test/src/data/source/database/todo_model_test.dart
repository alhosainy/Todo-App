import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:to_do_app/src/data/source/database/todo_database_impl.dart';
import 'package:to_do_app/src/domain/models/todo.dart';

void main() {
  late TodoDatabaseControllerImpl todoProvider;
  sqfliteFfiInit();

  const todo = Todo(
    todoId: '1',
    title: 'title',
    description: 'description',
    completed: false,
  );
  setUp(() async {
    todoProvider = TodoDatabaseControllerImpl();
    sqfliteFfiInit();
    // ignore: unused_local_variable
    var databaseFactory = databaseFactoryFfi;

  });

  test('should add a todo to the database', () async {
    final int = await todoProvider.insertTodo(todo);
    expect(int, 1);
  });
}

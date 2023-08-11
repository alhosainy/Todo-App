// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:to_do_app/src/data/source/database/todo_database.dart';
// import 'package:to_do_app/src/data/source/database/todo_database_impl.dart';
// import 'package:to_do_app/src/domain/models/todo.dart';
// import 'package:to_do_app/src/domain/models/todos.dart';
// import 'package:path/path.dart';

// class MockDatabase extends Mock implements Database {}

// void main() {
//   late TodoDatabaseControllerImpl controller;
//   late MockDatabase mockDatabase;
//   late Database db;

//   setUp(() async {
//     mockDatabase = MockDatabase();
//     controller = TodoDatabaseControllerImpl();
//     controller.db = mockDatabase;

//     // Open the database before each test
//     var databasesPath = await getDatabasesPath();
//     String path = join(databasesPath, 'test_todo.db');
//     controller.db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
// create table todo ( 
//   id integer primary key autoincrement, 
//   todoId text not null,
//   title text not null,
//   description text not null,
//   completed integer not null)
// ''');
//     });
//   });

//   test('insertTodo should insert a todo into the database', () async {
//     Todo todo = Todo(
//       todoId: '1',
//       title: 'Test todo',
//       description: 'This is a test todo',
//       completed: false,
//     );
//     await controller.insertTodo(todo);
//     List<Map<String, dynamic>> todos = await db.query('todo');
//     expect(todos.length, 1);
//     expect(todos[0]['title'], 'Test todo');
//   });

//   test('getAllTodos should return all todos from the database', () async {
//     Todo todo = Todo(
//       todoId: '1',
//       title: 'Test todo',
//       description: 'This is a test todo',
//       done: 0,
//     );
//     await openDb();
//     await insertTodo(todo);
//     Todos? todos = await getAllTodos();
//     expect(todos?.todos?.length, 1);
//     expect(todos?.todos?[0].title, 'Test todo');
//   });
//   test('insertTodo should insert a todo into the database', () async {
//     final todo = const Todo(
//       todoId: '1',
//       title: 'Test Todo',
//       description: 'This is a test todo.',
//       completed: false,
//     );

//     when(mockDatabase.insert(anyNamed('conflictAlgorithm'), any))
//         .thenAnswer((_) async => 1);

//     final result = await controller.insertTodo(todo);

//     expect(result, equals(1));
//     verify(mockDatabase.insert(any, any)).called(1);
//   });

//   test('getAllTodos should return a list of todos from the database', () async {
//     final todos = [
//       {
//         'todoId': '1',
//         'title': 'Test Todo 1',
//         'description': 'This is test todo 1.',
//         'completed': 0,
//       },
//       {
//         'todoId': '2',
//         'title': 'Test Todo 2',
//         'description': 'This is test todo 2.',
//         'completed': 1,
//       },
//     ];

//     when(mockDatabase.rawQuery('SELECT * FROM todo'))
//         .thenAnswer((_) async => todos);

//     final result = await controller.getAllTodos();

//     expect(result, isA<Todos>());
//     expect(result?.todos.length, equals(2));
//     expect(result?.todos[0].todoId, equals('1'));
//     expect(result?.todos[0].title, equals('Test Todo 1'));
//     expect(result?.todos[0].description, equals('This is test todo 1.'));
//     expect(result?.todos[0].completed, equals(false));
//     expect(result?.todos[1].todoId, equals('2'));
//     expect(result?.todos[1].title, equals('Test Todo 2'));
//     expect(result?.todos[1].description, equals('This is test todo 2.'));
//     expect(result?.todos[1].completed, equals(true));
//     verify(mockDatabase.rawQuery('SELECT * FROM todo')).called(1);
//   });

//   // Add tests for other methods...

//   tearDown(() {
//     controller.close();
//   });
// }

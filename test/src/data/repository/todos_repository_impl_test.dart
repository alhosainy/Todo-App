// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mockito/mockito.dart';
// // import 'package:mockito/annotations.dart';
// // import 'package:to_do_app/src/domain/models/todo.dart';
// // import 'package:to_do_app/src/domain/models/todos.dart';
// // import 'package:to_do_app/src/domain/repository/todos_repository.dart';

// // // Annotation which generates the cat.mocks.dart library and the MockCat class.
// // @GenerateNiceMocks([MockSpec<TodosRepository>()])
// // import 'todos_repository_impl_test.mocks.dart';

// // void main() {
// //   late MockTodosRepository todosRepository;
// //   late String path;

// //   setUp(() {
// //     todosRepository = MockTodosRepository();
// //     path = 'todos.json';
// //   });

// //   test('the path should be test.path', () async {
// //     final todos = await todosRepository.loadTodos();
// //     when(todosRepository.loadTodos()).thenAnswer((_) async => Todos);
// //     expect(todos, matcher)
// //   });
// // }
// //TODO create a test for [TodosRepositoryImpl]

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:to_do_app/src/data/repository/todos_repository_impl.dart';
// import 'package:to_do_app/src/data/source/storage/files.dart';
// import 'package:to_do_app/src/domain/models/todo.dart';
// import 'package:to_do_app/src/domain/models/todos.dart';
// import 'package:to_do_app/src/domain/repository/todos_repository.dart';

// @GenerateNiceMocks([MockSpec<Files>()])
// @GenerateNiceMocks([MockSpec<TodosRepositoryImpl>()])
// import 'todos_repository_impl_test.mocks.dart';

// void main() {
//   group('TodosRepositoryTmp Test', () {
//     MockFiles files =
//         MockFiles(); // You may need to create a mock or test version of Files class for testing.
//     MockTodosRepositoryImpl repository = MockTodosRepositoryImpl();

//     // Helper function to create a sample Todo object
//     Todo createSampleTodo(
//         String id, String title, String description, bool completed) {
//       return Todo(
//           id: id, title: title, description: description, completed: completed);
//     }

//     // Helper function to create a sample Todos object
//     Todos createSampleTodos(List<Todo> todosList) {
//       return Todos(todos: todosList);
//     }

//     // Sample Todos list for testing
//     List<Todo> sampleTodosList = [
//       createSampleTodo('1', 'title1', 'Task 1', false),
//       createSampleTodo('2', 'title2', 'Task 2', true),
//       createSampleTodo('3', 'title3', 'Task 3', false),
//     ];
//     String sampleJson =
//         '{"todos": [{"id": "1", "task": "Task 1", "completed": false},'
//         ' {"id": "2", "task": "Task 2", "completed": true},'
//         ' {"id": "3", "task": "Task 3", "completed": false}]}';

//     // Prepare a sample Todo to be saved
//     Todo sampleTodo = createSampleTodo('4', 'title4', 'New Task', false);

//     setUp(() {
//       when(repository.loadTodos())
//           .thenAnswer((_) async => createSampleTodos(sampleTodosList));
//       when(repository.saveTodo(sampleTodo)).thenAnswer((_) async {});
//       when(repository.deleteTodo(sampleTodo)).thenAnswer((_) async {});
//     });

//     test('Load Todos Test', () async {
//       // Call the loadTodos function and verify the result
//       Todos loadedTodos = await repository.loadTodos();
//       expect(loadedTodos.todos, sampleTodosList);
//     });

//     test('Save Todo Test', () async {
//       // Call the saveTodo function and verify the result
//       await repository.saveTodo(sampleTodo);

//       // Read the saved Todos and verify the added Todo
//       Todos savedTodos = await repository.loadTodos();
//       expect(savedTodos.todos.contains(sampleTodo), true);
//     });

//     test('Delete Todo Test', () async {
//       // Prepare a sample Todo to be deleted
//       Todo sampleTodo = createSampleTodo('1', 'title1', 'Task 1', false);

//       // Call the deleteTodo function and verify the result
//       await repository.deleteTodo(sampleTodo);

//       // Read the updated Todos and verify the deleted Todo
//       Todos updatedTodos = await repository.loadTodos();
//       expect(updatedTodos.todos.contains(sampleTodo), false);
//     });
//   });
// }
// //TODO create a test for [TodosRepositoryImpl.deleteAllTodos],[TodosRepositoryImpl.deleteTodoById],

import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/src/data/source/storage/internal_storage_impl.dart';
import 'package:to_do_app/src/domain/models/todo.dart';

void main() {
  late InternalStorageImpl mockInternalStorage;
  Map<String,dynamic> todo = {"id": "1", "task": "Task 1", "completed": false};
  Map<String,dynamic> fakeTodo = Todo.fromJson(todo).toJson();

  setUp(() {
    mockInternalStorage = InternalStorageImpl();
  });

  test('should write data to storage', () async {
    //Arrange

    //Act
    mockInternalStorage.write(todo);
    //Assert
  });
}

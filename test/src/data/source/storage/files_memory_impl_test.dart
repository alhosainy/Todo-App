import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/src/data/source/storage/files_memory_impl.dart';


void main() {
  late FilesMemoryImpl mockFiles;

  setDataForTest() {
    mockFiles.files.addAll({
      'test.path': 'test',
      'test2.path': 'test2',
      'test3.path': 'test3',
    });
  }

  setUp(() {
    mockFiles = FilesMemoryImpl();
  });

  test('should not be any data in memory', () {
    expect(mockFiles.files.length, 0);
  });

  test('should write data to memory', () async {
    //Arrange
    const String path = 'write.test.path';

    //Act
    expect(mockFiles.files, isEmpty);
    await mockFiles.write(path, 'test');
    //Assert
    expect(mockFiles.files[path], 'test');
  });

  test('should delete one item  from memory', () async {
    //Arrange
    setDataForTest();
    //Act
    expect(mockFiles.files.length, 3);
    //Assert
    await mockFiles.delete('test.path');
    expect(mockFiles.files.length, 2);
  });

  test('should read data from memory', () async {
    //Arrange
    setDataForTest();
    //Act
    final file = await mockFiles.read('test.path');
    //Assert
    expect(file, 'test');
  });
}

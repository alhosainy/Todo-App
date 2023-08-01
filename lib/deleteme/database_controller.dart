import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseController {
  static Database? _db;

  Future<Database?> getdb() async {
    if (_db == null) {
      _db = await initDatabase();
      return _db;
    } else {
      return _db;
    }
  }

  //initialize database
  initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'database.db');
    print('database path : $path');
    Database mydb = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE "list" (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT)');
        print(
            'created database =================================================================');
      },
    );
    return mydb;
  }

//delete database
  databaseDelete() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'my_database.db');
    await deleteDatabase(path);
  }

//getDatabasesPath
  Future<String> getDatabasePath() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'my_database.db');
    print(path);
    return path;
  }

//get the records
  Future getDatabase(String sql) async {
    Database? mydb = await _db;
    List<Map<String, Object?>>? records = await mydb?.rawQuery(sql);
    return records;
  }

//Select
  Future<List<Map<String, Object?>>?> readData(String sql) async {
    Database? mydb = await _db;
    List<Map<String, Object?>>? response = await mydb?.rawQuery(sql);
    return response;
  }

  //insert
  insertData(Map<String, Object> map) async {
    Database? mydb = await _db;
    await mydb?.insert(
      'list',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //update
  updateData(String sql) async {
    Database? mydb = await _db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  //delete
  deleteData(String sql) async {
    Database? mydb = await _db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
}

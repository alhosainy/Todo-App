import 'package:get/get.dart';
import 'package:to_do_app/src/data/source/storage/files_memory_impl.dart';

import '../database/todo_database.dart';
import '../database/todo_database_impl.dart';
import 'files.dart';

// class FilesController extends GetxController {
//   Rx<Files> file = FilesMemoryImpl().obs;
// }
class DatabaseController extends GetxController {
  Rx<TodoDatabaseController> database = TodoDatabaseControllerImpl().obs;
}

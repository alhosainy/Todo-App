import 'package:get/get.dart';

import '../database/todo_database.dart';
import '../database/todo_database_impl.dart';

class DatabaseController extends GetxController {
  Rx<TodoDatabaseController> database = TodoDatabaseControllerImpl().obs;
}

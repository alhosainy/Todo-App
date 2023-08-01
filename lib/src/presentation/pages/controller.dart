import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/controller.dart';

class AddTodoController extends GetxController {
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final title = TextEditingController().obs;
  final description = TextEditingController().obs;
  RxBool isCompleted = false.obs;
  final controller = Get.put(ListController()).obs;
}

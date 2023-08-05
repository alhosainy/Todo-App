import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewmodel/controller.dart';

class EditTodoController extends GetxController {
  final Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final title = TextEditingController().obs;
  final description = TextEditingController().obs;
  RxBool isCompleted = false.obs;
  RxBool isEdited = false.obs;
  final controller = Get.put(ViewModelController()).obs;
  final model = Get.find<ViewModelController>();

  clearValues() {
    title.value.clear();
    description.value.clear();
    isCompleted.value = false;
    isEdited.value = false;
    title.refresh();
    description.refresh();
    isCompleted.refresh();
    isEdited.refresh();
  }
}

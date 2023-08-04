// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortid/shortid.dart';

import '../../domain/models/todo.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../pages.dart';
import '../viewmodel/controller.dart';
import 'controller.dart';

class TodoEdit extends StatelessWidget {
  const TodoEdit({
    Key? key,
    this.todoId,
  }) : super(key: key);
  final String? todoId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditTodoController(), permanent: true);
    final model = Get.find<ViewModelController>();

    model.logger.value.i('controllers updated with id: $todoId');
    if (todoId != null) {
      model.getTodo(todoId!).then((value) {
        if (value != null) {
          controller.title.value.text = value.title;
          controller.description.value.text = value.description ?? '';
          controller.isCompleted.value = value.completed;
          controller.title.refresh();
          controller.description.refresh();
          controller.isCompleted.refresh();
        } else {
          controller.clearValues();
        }
      });
    }

    // ignore: no_leading_underscores_for_local_identifiers
    Future<bool> _onWillPop() async {
      Get.defaultDialog(
          title: 'Discard changes?',
          middleText: 'Are you sure you want to discard changes?',
          confirm: TextButton(
            child: const Text('Yes'),
            onPressed: () {
              controller.clearValues();
              Get.offAllNamed(Routes.HOME);
            },
          ),
          cancel: TextButton(
            onPressed: () => Get.back(),
            child: const Text('No'),
          ));
      return false;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor(context),
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Add Todo'),
          centerTitle: true,
          actions: [
            //TODO add delete button
          ],
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: PAD_ALL_10,
              child: Form(
                key: controller.formKey.value,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      autofocus: true,
                      controller: controller.title.value,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                      onChanged: (_) => controller.edited.value = true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.description.value,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      onChanged: (_) => controller.edited.value = true,
                    ),
                    Obx(() {
                      return CheckboxListTile(
                          title: const Text('Completed'),
                          value: controller.isCompleted.value,
                          onChanged: (value) {
                            controller.isCompleted.value = value!;
                            controller.isCompleted.refresh();
                          });
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            if (controller.formKey.value.currentState!.validate()) {
              controller.formKey.value.currentState!.save();

              final todo = Todo(
                description: controller.description.value.value.text,
                id: todoId ?? shortid.generate(),
                title: controller.title.value.value.text,
                completed: controller.isCompleted.value,
              );

              await model.save(todo);
              controller.clearValues();
              Get.snackbar('hurray!', 'Todo saved!');
              ScaffoldMessenger.of(context).toast('Todo saved!');

              Get.back(closeOverlays: true);
            }
          },
          label: const Text(
            'Add note',
          ),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}

extension on ScaffoldMessengerState {
  void toast(String message) {
    showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }
}

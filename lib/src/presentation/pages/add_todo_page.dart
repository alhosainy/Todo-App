import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shortid/shortid.dart';
import '../../domain/usecases/controller.dart';
import '../../res/dimens.dart';
import '../../domain/models/todo.dart';
import '../../res/colors.dart';
import '../viewmodel/controller.dart';
import 'controller.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddTodoController());
    final model = Get.find<ListController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(context),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Add Todo'),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: PAD_ALL_5,
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
                  ),
                  Obx(() {
                    return CheckboxListTile(
                        title: const Text('Completed'),
                        value: controller.isCompleted.value,
                        onChanged: (value) {
                          controller.isCompleted.value = value!;
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
              id: shortid.generate(),
              title: controller.title.value.value.text,
              completed: controller.isCompleted.value,
            );

            model.save(todo);
            Get.snackbar('hurray!', 'Todo saved!');

            Get.back(closeOverlays: true);
          }
        },
        label: const Text(
          'Add note',
        ),
        icon: const Icon(Icons.save),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/src/presentation/pages.dart';
import 'package:to_do_app/src/presentation/widgets/my_todo_widget.dart';
import 'package:to_do_app/src/res/dimens.dart';

import '../../res/colors.dart';
import '../viewmodel/controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListController controller =
        Get.put(ListController(), permanent: true);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(context),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Todos'),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => Get.toNamed(Routes.ADDTODO),
            splashColor: Colors.brown[100],
            icon: const Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
        ],
      ),
      body: Obx(() {
        controller.getTodos();
        
        return ListView.builder(
          padding: PAD_ASYM_H10_V5,
          itemCount: controller.todosList.value.todos.length,
          itemBuilder: (context, index) {
            return MyTodoWidget(
              title: controller.todosList.value.todos[index].title,
              description: controller.todosList.value.todos[index].description,
              deleteFunction: () {
                print('Deleted');
              },
            );
          },
        );
      }),
    );
  }
}

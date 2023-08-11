import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../themes.dart';

import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../pages.dart';
import '../viewmodel/controller.dart';
import '../widgets/my_todo_tile.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ViewModelController controller =
        Get.put(ViewModelController(), permanent: true);

    final activeTodos = controller.activeTodos;
    final completedTodos = controller.completedTodos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor(context),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Todos'),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () => Get.toNamed(Routes.EDITTODO),
            splashColor: Colors.brown[100],
            icon: const Icon(Icons.add),
            tooltip: 'Add Todo',
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Light Theme'),
                  onTap: () => Get.changeTheme(lightTheme),
                ),
                PopupMenuItem(
                  child: const Text('Dark Theme'),
                  onTap: () => Get.changeTheme(darkTheme),
                ),
              ];
            },
          )
        ],
      ),
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: controller.todosList.value.todos.isEmpty
                  ? const Center(child: Text('No Todos'))
                  : ListView.builder(
                      padding: PAD_ASYM_H10_V5,
                      itemCount: activeTodos.length,
                      itemBuilder: (context, index) {
                        final todo = activeTodos[index];
                        return MyTodoTile(
                          todo: todo,
                        );
                      },
                    ),
            ),
            if (completedTodos.isNotEmpty)
              ExpansionTile(
                title: const Text('Completed'),
                children: [
                  for (final todo in completedTodos) MyTodoTile(todo: todo),
                ],
              ),
          ],
        );
      }),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/models/todo.dart';
import '../../res/styles.dart';
import '../pages.dart';
import '../viewmodel/controller.dart';

class MyTodoTile extends StatelessWidget {
  MyTodoTile({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final controller = Get.find<ViewModelController>();
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo.title,
        style: boldStyle,
      ),
      subtitle: todo.description != null && todo.description!.isNotEmpty
          ? Text(todo.description!)
          : null,
      onTap: () {
        Get.toNamed('${Routes.EDITTODO}${todo.todoId}');
      },
      trailing: Checkbox(
          value: todo.completed,
          onChanged: (value) {
            final newTodo = todo.copyWith(completed: value!);
            controller.save(newTodo);
            controller.activeTodos.refresh();
            controller.completedTodos.refresh();
          }),
    );
  }
}

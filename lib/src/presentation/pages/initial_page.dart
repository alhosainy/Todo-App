// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/repository/controller.dart';
import '../../res/colors.dart';
import '../pages.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 500), () => Get.offNamed(Routes.HOME));
  }

  @override
  Widget build(BuildContext context) {
    final todoController = Get.put(TodosController(), permanent: true);
    todoController.todosController.value.openDB();
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 200, bottom: 10),
          child: Container(
            height: 200,
            width: 200,
/*decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('images/img_splash.png'),
fit: BoxFit.fill)),*/
          ),
        ),
        Text(
          'TODO APP',
          style: TextStyle(
              color: primaryColor(context),
              fontSize: 20,
              decoration: TextDecoration.none),
        ),
      ]),
    );
  }
}

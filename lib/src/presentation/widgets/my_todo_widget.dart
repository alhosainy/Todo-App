// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

import 'package:to_do_app/src/res/dimens.dart';

import '../../res/styles.dart';

class MyTodoWidget extends StatelessWidget {
  const MyTodoWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.deleteFunction,
  }) : super(key: key);
  final String title;
  final String? description;
  final Callback deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: PAD_ALL_10,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(title, style: titleStyle)),
              Text(description ?? '', style: boldStyle),
              Center(
                child: TextButton(
                  onPressed: deleteFunction,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.brown[300]),
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  child: const Text('Delete '),
                ),
              ),
            ]),
      ),
    );
  }
}

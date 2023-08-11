import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/src/presentation/pages.dart';
import 'package:to_do_app/src/presentation/themes.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
}

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      enableLog: true,
    ),
  );
  Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
}

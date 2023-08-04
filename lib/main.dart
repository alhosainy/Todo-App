import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/src/presentation/pages.dart';
import 'package:to_do_app/src/presentation/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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

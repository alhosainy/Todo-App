import 'package:flutter/material.dart';

class AppThemes {
  
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        brightness: Brightness.light,
      ));

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        brightness: Brightness.dark,
      ));
}

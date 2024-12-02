import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xfffffc00)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(primary: const Color(0xfffffc00), secondary: Colors.black),
    buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(170, 179, 177, 177)),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          return const TextStyle(color: Colors.black);
        }),
      ),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: Colors.black),
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
  );
}

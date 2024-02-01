import 'package:flutter/material.dart';

class MyThemes {

  static final lightThemes = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      onPrimary: Colors.black,
      brightness: Brightness.light,
      background: const Color(0xFFFFFFFF)
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald-Bold.ttf',
      ),
      titleLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald-Bold.ttf',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Oswald-Regular.ttf',
      ),
      displaySmall: TextStyle(
        fontFamily: 'Oswald-Regular.ttf',
      ),
    ),
  );
  static final darkThemes = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      onPrimary: Colors.white,
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald-Bold.ttf',
      ),
      titleLarge:  TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald-Regular.ttf',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Oswald-Regular.ttf',
      ),
      displaySmall: TextStyle(
        fontFamily: 'Oswald-Regular.ttf',
      ),
    ),
  );
}

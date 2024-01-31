import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {

  static const List<Color> lightColorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static const List<Color> darkColorizeColors = [
    Colors.white,
    Colors.amber,
    Colors.blueGrey,
    Colors.greenAccent,
  ];

  static const TextStyle lightColorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Horizon',
  );

  static const TextStyle darkColorizeTextStyle = TextStyle(
    fontSize: 20.0,
    fontFamily: 'Horizon',
    color: Colors.white,
  );
  static final lightThemes = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      onPrimary: Colors.black,
      brightness: Brightness.light,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  );
  static final darkThemes = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.black,
      onPrimary: Colors.white,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72,
        fontWeight: FontWeight.bold,
      ),
      // ···
      titleLarge: GoogleFonts.oswald(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.merriweather(),
      displaySmall: GoogleFonts.pacifico(),
    ),
  );
}

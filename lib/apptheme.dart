import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      primaryColor: Color.fromARGB(255, 123, 212, 142),
      primaryColorLight: Color.fromARGB(255, 207, 236, 211),
      primaryColorDark: Color.fromARGB(255, 24, 46, 11),
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 123, 212, 142),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.red,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xff439FBC),
        selectionColor: Color(0xff439FBC),
        selectionHandleColor: Color(0xff439FBC),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xff439FBC),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      textSelectionTheme:
          const TextSelectionThemeData(selectionHandleColor: Color(0xff439FBC)),
      primaryColor: const Color(0xff439FBC),
      primaryColorDark: const Color(0xff071526),
      primaryColorLight: const Color(0xff72BFD6),
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.red,
      ),
    );
  }
}
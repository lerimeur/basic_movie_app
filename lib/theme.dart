import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: const Color.fromRGBO(39, 48, 60, 1),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(42, 46, 52, 1),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      color: Color.fromRGBO(255, 255, 255, 1),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: Color.fromRGBO(224, 224, 224, 1),
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      color: Color.fromRGBO(224, 224, 224, 0.448),
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);

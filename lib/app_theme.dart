import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.grey.shade500,
  scaffoldBackgroundColor: Colors.grey.shade700,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade700,
    centerTitle: true,
  ),
  dialogBackgroundColor: Colors.grey.shade700,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 35, fontWeight: FontWeight.w700),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.grey.shade600,
    ),
  ),
);

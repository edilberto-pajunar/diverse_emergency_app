import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._({required this.isDarkMode});

  final bool isDarkMode;

  static final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
  );

  static final ThemeData theme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: border,
      focusedBorder: border,
      errorBorder: border,
      enabledBorder: border,
    ),
  );
}

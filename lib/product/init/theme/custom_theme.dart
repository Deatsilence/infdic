import 'package:flutter/material.dart';

/// [CustomTheme] is custom theme
abstract class CustomTheme {
  /// [themeData] is theme data for light theme
  ThemeData get themeData;

  /// [elevatedButtonThemeData] is theme data for elevated button
  ElevatedButtonThemeData get elevatedButtonThemeData;
}

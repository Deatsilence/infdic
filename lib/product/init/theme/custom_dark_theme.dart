import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infdic/product/init/theme/custom_color_scheme.dart';
import 'package:infdic/product/init/theme/custom_theme.dart';

/// [CustomDarkTheme] is custom light theme
final class CustomDarkTheme implements CustomTheme {
  // TODO: Change to initialize ThemeData instead of computed

  /// [CustomDarkTheme] is custom light theme
  CustomDarkTheme() {
    themeData = ThemeData(
      useMaterial3: true,
      colorScheme: CustomColorScheme.darkColorScheme,
      fontFamily: GoogleFonts.roboto().fontFamily,
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
    );
  }

  @override
  late final ThemeData themeData;

  @override
  final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColorScheme.darkColorScheme.primary,
      foregroundColor: CustomColorScheme.darkColorScheme.onPrimary,
      disabledBackgroundColor: CustomColorScheme.darkColorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.moreBorderRadius,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );

  /// [outlinedButtonThemeData] is theme data for outlined button light theme
  @override
  final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: CustomColorScheme.darkColorScheme.secondary,
      side: BorderSide(
        color: CustomColorScheme.darkColorScheme.primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.moreBorderRadius,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

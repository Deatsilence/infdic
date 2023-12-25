import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infdic/product/init/theme/custom_color_scheme.dart';
import 'package:infdic/product/init/theme/custom_theme.dart';

/// [CustomLightTheme] is custom light theme
final class CustomLightTheme implements CustomTheme {
  // TODO: Change to initialize ThemeData instead of computed

  /// [CustomLightTheme] is custom light theme
  CustomLightTheme() {
    themeData = ThemeData(
      useMaterial3: true,
      colorScheme: CustomColorScheme.lightColorScheme,
      fontFamily: GoogleFonts.roboto().fontFamily,
      elevatedButtonTheme: elevatedButtonThemeData,
      outlinedButtonTheme: outlinedButtonThemeData,
    );
  }

  /// [themeData] is theme data for light theme
  @override
  late final ThemeData themeData;

  /// [elevatedButtonThemeData] is theme data for elevated button light theme
  @override
  final ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: CustomColorScheme.lightColorScheme.primary,
      foregroundColor: CustomColorScheme.lightColorScheme.onPrimary,
      disabledBackgroundColor: CustomColorScheme.lightColorScheme.onSurface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.moreBorderRadius,
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );

  @override

  /// [outlinedButtonThemeData] is theme data for outlined button light theme
  final OutlinedButtonThemeData outlinedButtonThemeData =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: CustomColorScheme.lightColorScheme.onPrimary,
      foregroundColor: CustomColorScheme.lightColorScheme.primary,
      side: BorderSide(
        color: CustomColorScheme.lightColorScheme.primary,
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

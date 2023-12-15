import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infdic/product/init/theme/custom_color_scheme.dart';
import 'package:infdic/product/init/theme/custom_theme.dart';

/// [CustomLightTheme] is custom light theme
final class CustomLightTheme implements CustomTheme {
  // TODO: Change to initialize ThemeData instead of computed

  /// [themeData] is theme data for light theme
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
        fontFamily: GoogleFonts.roboto().fontFamily,
      );
}

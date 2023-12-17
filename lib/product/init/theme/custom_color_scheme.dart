import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

/// [CustomColorScheme] is global color scheme for app
@immutable
final class CustomColorScheme {
  const CustomColorScheme._();

  /// [lightColorScheme] is light color scheme for app
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF006874),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF97F0FF),
    onPrimaryContainer: Color(0xFF001F24),
    secondary: ColorName.gray410,
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFF99F0FF),
    onSecondaryContainer: Color(0xFF001F24),
    tertiary: Color(0xFF875300),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDDBA),
    onTertiaryContainer: Color(0xFF2B1700),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFAFDFD),
    onBackground: Color(0xFF191C1D),
    surface: Color(0xFFFAFDFD),
    onSurface: Color(0xFF191C1D),
    surfaceVariant: Color(0xFFDBE4E6),
    onSurfaceVariant: Color(0xFF3F484A),
    outline: Color(0xFF6F797A),
    onInverseSurface: Color(0xFFEFF1F1),
    inverseSurface: Color(0xFF2E3132),
    inversePrimary: Color(0xFF4FD8EB),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006874),
    outlineVariant: Color(0xFFBFC8CA),
    scrim: Color(0xFF000000),
  );

  /// [darkColorScheme] is dark color scheme for app
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF006874),
    onPrimary: Color(0xFF00363D),
    primaryContainer: Color(0xFF004F58),
    onPrimaryContainer: Color(0xFF97F0FF),
    secondary: Color(0xFFFFFFFF),
    onSecondary: Color(0xFF00363D),
    secondaryContainer: Color(0xFF004F58),
    onSecondaryContainer: Color(0xFF99F0FF),
    tertiary: Color(0xFFFFB964),
    onTertiary: Color(0xFF482A00),
    tertiaryContainer: Color(0xFF663E00),
    onTertiaryContainer: Color(0xFFFFDDBA),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E3),
    surface: Color(0xFF191C1D),
    onSurface: Color(0xFFE1E3E3),
    surfaceVariant: Color(0xFF3F484A),
    onSurfaceVariant: Color(0xFFBFC8CA),
    outline: Color(0xFF899294),
    onInverseSurface: Color(0xFF191C1D),
    inverseSurface: Color(0xFFE1E3E3),
    inversePrimary: Color(0xFF006874),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4FD8EB),
    outlineVariant: Color(0xFF3F484A),
    scrim: Color(0xFF000000),
  );
}

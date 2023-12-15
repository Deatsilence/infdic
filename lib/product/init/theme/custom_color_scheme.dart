import 'package:flutter/material.dart';

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
    secondary: Color(0xFF00677F),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFB6EAFF),
    onSecondaryContainer: Color(0xFF001F28),
    tertiary: Color(0xFF006688),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFC2E8FF),
    onTertiaryContainer: Color(0xFF001E2C),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFF8FDFF),
    onBackground: Color(0xFF001F25),
    surface: Color(0xFFF8FDFF),
    onSurface: Color(0xFF001F25),
    surfaceVariant: Color(0xFFDBE4E6),
    onSurfaceVariant: Color(0xFF3F484A),
    outline: Color(0xFF6F797A),
    onInverseSurface: Color(0xFFD6F6FF),
    inverseSurface: Color(0xFF00363F),
    inversePrimary: Color(0xFF4FD8EB),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF006874),
    outlineVariant: Color(0xFFBFC8CA),
    scrim: Color(0xFF000000),
  );

  /// [darkColorScheme] is dark color scheme for app
  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF4FD8EB),
    onPrimary: Color(0xFF00363D),
    primaryContainer: Color(0xFF004F58),
    onPrimaryContainer: Color(0xFF97F0FF),
    secondary: Color(0xFF5CD5FB),
    onSecondary: Color(0xFF003543),
    secondaryContainer: Color(0xFF004E60),
    onSecondaryContainer: Color(0xFFB6EAFF),
    tertiary: Color(0xFF76D1FF),
    onTertiary: Color(0xFF003548),
    tertiaryContainer: Color(0xFF004D67),
    onTertiaryContainer: Color(0xFFC2E8FF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF001F25),
    onBackground: Color(0xFFA6EEFF),
    surface: Color(0xFF001F25),
    onSurface: Color(0xFFA6EEFF),
    surfaceVariant: Color(0xFF3F484A),
    onSurfaceVariant: Color(0xFFBFC8CA),
    outline: Color(0xFF899294),
    onInverseSurface: Color(0xFF001F25),
    inverseSurface: Color(0xFFA6EEFF),
    inversePrimary: Color(0xFF006874),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4FD8EB),
    outlineVariant: Color(0xFF3F484A),
    scrim: Color(0xFF000000),
  );
}

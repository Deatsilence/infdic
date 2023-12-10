import 'package:flutter/material.dart';

/// Project locale enum for operation and configuration

enum Locales {
  /// Turkish locale
  tr(locale: Locale('tr', 'TR')),

  /// English locale
  en(locale: Locale('en', 'US'));

  /// Locale value
  final Locale locale;

  /// Constructor method
  const Locales({required this.locale});
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/utility/constants/enums/locales.dart';

/// Product localization manager
@immutable
final class ProductLocalization extends EasyLocalization {
  /// ProductLocalization need to [child] for a wrap local item
  ProductLocalization({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    const Locale('tr', 'TR'),
    const Locale('en', 'US'),
  ];

  static const String _translationPath = 'assets/translations';

  /// Change project language by using [Locales]
  static Future<void> updateLanguage({
    required BuildContext context,
    required Locales value,
  }) =>
      context.setLocale(value.locale);
}

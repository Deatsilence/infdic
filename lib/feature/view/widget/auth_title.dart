import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// [AuthTitle] is the title of auth
final class AuthTitle extends StatelessWidget {
  /// Constructor
  const AuthTitle({required String title, super.key}) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        _title,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ).tr(),
    );
  }
}

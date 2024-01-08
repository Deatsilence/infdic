import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

/// [AuthTitle] is the title of auth
final class AuthTitle extends StatelessWidget {
  /// Constructor
  const AuthTitle({
    required String title,
    AlignmentGeometry textAlignment = Alignment.centerLeft,
    super.key,
  })  : _title = title,
        _alignment = textAlignment;

  final String _title;
  final AlignmentGeometry _alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: _alignment,
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

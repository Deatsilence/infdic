import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// [AuthSvg] is the svg of auth
final class AuthSvg extends StatelessWidget {
  /// Constructor
  const AuthSvg({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusManager.moreBorderRadius,
      ),
      color: Theme.of(context).colorScheme.outlineVariant,
      child: _child,
    );
  }
}

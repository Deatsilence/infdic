import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// [AuthSvg] is the svg of auth
final class AuthSvg extends StatelessWidget {
  /// Constructor
  const AuthSvg({
    required double height,
    required Widget child,
    super.key,
  })  : _height = height,
        _child = child;

  final double? _height;
  final Widget? _child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusManager.moreBorderRadius,
        ),
        color: Theme.of(context).colorScheme.outlineVariant,
        child: _child,
      ),
    );
  }
}

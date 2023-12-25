// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// [AuthCustomOutlinedButton] is custom elevated button
final class AuthCustomOutlinedButton extends StatelessWidget {
  /// Constructor
  const AuthCustomOutlinedButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.height = 50,
    this.width = double.infinity,
  });

  final VoidCallback? onPressed;
  final Widget? child;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        // TODO: This will edit later for in INFD-6
        style: Theme.of(context).outlinedButtonTheme.style,
        child: child,
      ),
    );
  }
}

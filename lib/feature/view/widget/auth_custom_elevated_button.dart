// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// [AuthCustomElevatedButton] is custom elevated button
final class AuthCustomElevatedButton extends StatelessWidget {
  /// Constructor
  const AuthCustomElevatedButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  final void Function()? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // TODO: This will edit later for in INFD-6
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
      child: child,
    );
  }
}

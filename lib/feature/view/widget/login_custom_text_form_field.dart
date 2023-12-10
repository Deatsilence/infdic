// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// This is for authentication text form field
final class LoginCustomTextFormField extends StatefulWidget {
  /// Constructor
  const LoginCustomTextFormField({
    super.key,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? labelText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<LoginCustomTextFormField> createState() =>
      _LoginCustomTextFormFieldState();
}

class _LoginCustomTextFormFieldState extends State<LoginCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: CustomInputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
      ),
      validator: widget.validator,
    );
  }
}

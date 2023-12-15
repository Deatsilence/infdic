// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is for authentication text form field
final class LoginCustomTextFormField extends StatefulWidget {
  /// Constructor
  const LoginCustomTextFormField({
    super.key,
    this.labelText,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
  });

  final String? labelText;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

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
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
    );
  }
}

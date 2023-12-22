// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is for authentication text form field
final class CustomTextFormField extends StatefulWidget {
  /// Constructor
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.validator,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.borderColor,
    this.activeBorderColor,
    this.deActiveBorderColor,
    this.errorBorderColor,
    this.obscureText = false,
    this.obscuringCharacter = '•',
  });

  final String? labelText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Color? borderColor;
  final Color? activeBorderColor;
  final Color? deActiveBorderColor;
  final Color? errorBorderColor;
  final bool obscureText;
  final String obscuringCharacter;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: CustomInputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        labelText: widget.labelText,
        borderColor:
            widget.borderColor ?? Theme.of(context).colorScheme.primary,
        enableBorderColor:
            widget.activeBorderColor ?? Theme.of(context).colorScheme.secondary,
        deActiveBorderColor: widget.deActiveBorderColor ??
            Theme.of(context).colorScheme.secondary,
        errorBorderColor:
            widget.errorBorderColor ?? Theme.of(context).colorScheme.error,
      ),
      validator: widget.validator,
      onSaved: widget.onSaved,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
    );
  }
}

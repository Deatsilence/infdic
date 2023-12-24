import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';

/// [SignUpViewMixin] is logics of signup view
mixin SignUpViewMixin on State<SignUpView> {
  /// This is key for signup form
  final signUpFormKey = GlobalKey<FormState>();

  /// [emailController] is controller for email field
  final TextEditingController emailController = TextEditingController();

  /// [passwordController] is controller for email field
  final TextEditingController passwordController = TextEditingController();

  /// [confirmPasswordController] is controller for email field
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /// [confirmPasswordValidator] is validator for password field
  String? confirmPasswordValidator(String? value) => value.hasValue
      ? value == passwordController.text
          ? null
          : LocaleKeys.auth_passwords_have_to_match.tr()
      : LocaleKeys.auth_password_repeat_have_not_to_be_empty.tr();

  /// [onSignUpPressed] is function for signup button
  void onSignUpPressed() {
    if (signUpFormKey.currentState != null &&
        signUpFormKey.currentState!.validate()) {
      signUpFormKey.currentState!.save();
      debugPrint('success');
    }
  }
}

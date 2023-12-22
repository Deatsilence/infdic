import 'package:common/common.dart';
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

  // TODO: validators will be moved to another file
  /// [emailValidator] is validator for email field
  String? emailValidator(String? value) =>
      value!.hasValue && InfDicRegExp().emailRegexp.hasMatch(value)
          ? null
          : LocaleKeys.auth_please_enter_a_valid_email.tr();

  /// [passwordValidator] is validator for password field
  String? passwordValidator(String? value) =>
      value.hasValue && InfDicRegExp().passwordRegexp.hasMatch(value!)
          ? null
          : LocaleKeys.auth_please_enter_a_valid_password.tr();
}

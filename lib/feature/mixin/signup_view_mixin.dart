import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';
import 'package:infdic/feature/view_model/signup_view_model.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/utility/extension/has_value_extension.dart';

/// [SignUpViewMixin] is logics of signup view
mixin SignUpViewMixin on State<SignUpView> {
  /// [_signUpViewModel] is the view model of home page
  late final SignUpViewModel _signUpViewModel;

  /// [_signUpFormKey] is key for signup form
  late final GlobalKey<FormState> _signUpFormKey;

  /// [_emailController] is controller for email field
  late final TextEditingController _emailController;

  /// [_passwordController] is controller for email field
  late final TextEditingController _passwordController;

  /// [_confirmPasswordController] is controller for email field
  late final TextEditingController _confirmPasswordController;

  /// [SignUpViewModel] is the view model of home page
  SignUpViewModel get signUpViewModel => _signUpViewModel;

  /// [signUpFormKey] is key for signup form
  GlobalKey<FormState> get signUpFormKey => _signUpFormKey;

  /// [emailController] is controller for email field
  TextEditingController get emailController => _emailController;

  /// [passwordController] is controller for email field
  TextEditingController get passwordController => _passwordController;

  /// [confirmPasswordController] is controller for email field
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _signUpViewModel = SignUpViewModel();
    _signUpFormKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

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
      context.router.push(
        PhoneNumberVerificationRoute(
          email: emailController.text.trim(),
        ),
      );
    }
  }
}

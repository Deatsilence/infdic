import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/login_view.dart';
import 'package:infdic/product/navigation/app_router.dart';

/// This is logics of login view
/// [_loginFormKey] is key for login form
mixin LoginViewMixin on State<LoginView> {
  /// This is key for login form
  late final GlobalKey<FormState> _loginFormKey;

  /// [_emailController] is controller for email field
  late final TextEditingController _emailController;

  /// [_passwordController] is controller for email field
  late final TextEditingController _passwordController;

  /// [loginFormKey] is key for login form
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  /// [emailController] is controller for email field
  TextEditingController get emailController => _emailController;

  /// [passwordController] is controller for email field
  TextEditingController get passwordController => _passwordController;

  @override
  void initState() {
    super.initState();
    _loginFormKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /// [onLoginPressed] is function for login button
  void onLoginPressed() {
    if (loginFormKey.currentState != null &&
        loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
    }
  }

  /// [onSignUpPressed] is function for sign in button
  Future<void> onSignUpPressed() async {
    await context.router.push<bool?>(const PhoneNumberVerificationRoute());
  }
}

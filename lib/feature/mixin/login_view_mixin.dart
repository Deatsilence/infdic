import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/login_view.dart';

/// This is logics of login view
/// [loginFormKey] is key for login form
mixin LoginViewMixin on State<LoginView> {
  /// This is key for login form
  final loginFormKey = GlobalKey<FormState>();

  /// [emailController] is controller for email field
  final TextEditingController emailController = TextEditingController();

  /// [passwordController] is controller for email field
  final TextEditingController passwordController = TextEditingController();

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
}

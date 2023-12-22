import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/login_view.dart';

/// This is logics of login view
/// [loginFormKey] is key for login form
mixin LoginViewMixin on State<LoginView> {
  /// This is key for login form
  final loginFormKey = GlobalKey<FormState>();
}

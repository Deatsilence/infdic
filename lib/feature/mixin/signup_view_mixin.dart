import 'package:flutter/material.dart';
import 'package:infdic/feature/view/signup_view.dart';

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
}

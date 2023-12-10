import 'package:flutter/material.dart';
import 'package:infdic/feature/mixin/login_view_mixin.dart';
import 'package:infdic/feature/view/widget/login_custom_text_form_field.dart';

/// This is login page
final class LoginView extends StatefulWidget {
  /// Constructor
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Form(
            key: loginFormKey,
            child: const Column(
              children: [
                Text('Login'),
                LoginCustomTextFormField(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Email',
                ),
                LoginCustomTextFormField(
                  prefixIcon: Icon(Icons.password_outlined),
                  labelText: 'Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

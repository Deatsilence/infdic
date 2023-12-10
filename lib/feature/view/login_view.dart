import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/mixin/login_view_mixin.dart';
import 'package:infdic/feature/view/widget/login_custom_text_form_field.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';

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
            child: Column(
              children: [
                const Text(LocaleKeys.login_title).tr(),
                LoginCustomTextFormField(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: LocaleKeys.login_email.tr(),
                ),
                LoginCustomTextFormField(
                  prefixIcon: const Icon(Icons.password_outlined),
                  labelText: LocaleKeys.login_password.tr(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
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
        child: Padding(
          padding:
              PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
          child: SizedBox(
            child: Form(
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusManager.moreBorderRadius,
                        ),
                        color: Theme.of(context).colorScheme.background,
                        child: const SizedBox(
                          height: 200,
                          width: double.infinity,
                        ),
                      ),
                      const Text('Learn words'),
                      Positioned.fill(
                        child: Center(
                          child: Assets.icons.icLogin.svg(package: 'gen'),
                        ),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/login_view_mixin.dart';
import 'package:infdic/feature/view/widget/auth_custom_elevated_button.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:sizer/sizer.dart';

part '../part_of_view/part_of_login_view.dart';

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
                  const Expanded(flex: 14, child: _LoginSvg()),
                  const Expanded(flex: 2, child: _SignInTitle()),
                  const _EmailAndPasswordTextFields(),
                  ...[
                    const Expanded(child: _RememberMeCheckBox()),
                    const Expanded(
                      flex: 2,
                      child: _AuthLoginButtons(),
                    ),
                  ].seperate(space: 2.h),
                  const Expanded(child: _AuthDivider()),
                  SizedBox(
                    height: 8.h,
                    width: double.infinity,
                    child: AuthCustomElevatedButton(
                      onPressed: () {},
                      child: const Text(LocaleKeys.general_button_forgot).tr(),
                    ),
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/signup_view_mixin.dart';
import 'package:infdic/feature/view/base_auth_view.dart';
import 'package:infdic/feature/view/widget/auth_svg.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

/// [SignUpView] is the view of sign up page
class SignUpView extends StatefulWidget {
  /// Constructor
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with SignUpViewMixin {
  bool success = false;
  @override
  Widget build(BuildContext context) {
    return BaseAuthView(
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            AuthSvg(
              height: 30.h,
              child: Assets.icons.icSignup.svg(package: 'gen'),
            ),
            const AuthTitle(title: LocaleKeys.auth_signUp)
                .onlyPadding(top: 1.h, bottom: 1.h),
            CustomTextFormField(
              controller: emailController,
              prefixIcon: const Icon(Icons.email_outlined),
              labelText: LocaleKeys.auth_email.tr(),
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.lock_outline),
              labelText: LocaleKeys.auth_password.tr(),
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.repeat),
              labelText: LocaleKeys.auth_confirm_password.tr(),
            ),
            SizedBox(
              height: 7.h,
              child: AuthCustomElevatedButton(
                onPressed: () {},
                child: const Text(LocaleKeys.auth_signUp).tr(),
              ),
            ),
            FlutterPwValidator(
              defaultColor: Theme.of(context).disabledColor,
              controller: emailController,
              successColor: Colors.green.shade700,
              minLength: 8,
              uppercaseCharCount: 2,
              numericCharCount: 3,
              specialCharCount: 1,
              normalCharCount: 3,
              width: 50.w,
              height: 10.h,
              onSuccess: () {
                setState(() {
                  success = true;
                });
              },
              onFail: () {
                setState(() {
                  success = false;
                });
              },
            ).onlyPadding(top: 1.h),
          ],
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/signup_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/auth_is_info_valid.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';
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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpFormKey,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: BaseAuthView(
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
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: LocaleKeys.auth_password.tr(),
                  keyboardType: TextInputType.visiblePassword,
                  validator: passwordValidator,
                ),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  prefixIcon: const Icon(Icons.repeat),
                  labelText: LocaleKeys.auth_confirm_password.tr(),
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 7.h,
                  child: AuthCustomElevatedButton(
                    onPressed: () {
                      if (signUpFormKey.currentState!.validate()) {
                        signUpFormKey.currentState!.save();
                        debugPrint('success');
                      }
                    },
                    child: const Text(LocaleKeys.auth_signUp).tr(),
                  ),
                ),
                AuthIsInfoValid(controller: passwordController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

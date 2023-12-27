import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/signup_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/auth_is_info_valid.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/validation/validation.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:sizer/sizer.dart';

/// [SignUpView] is the view of sign up page
@RoutePage<bool?>()
final class SignUpView extends StatefulWidget {
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
      child: BaseAuthView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              AuthSvg(
                child: Assets.icons.icSignup.svg(package: 'gen', height: 30.h),
              ),
              const AuthTitle(title: LocaleKeys.auth_signUp)
                  .onlyPadding(top: 1.h, bottom: 1.h),
              CustomTextFormField(
                controller: emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: LocaleKeys.auth_email.tr(),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                validator: Validation().emailValidator,
              ),
              CustomTextFormField(
                controller: passwordController,
                prefixIcon: const Icon(Icons.lock_outline),
                hintText: LocaleKeys.auth_password.tr(),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                validator: Validation().passwordValidator,
              ),
              CustomTextFormField(
                controller: confirmPasswordController,
                prefixIcon: const Icon(Icons.repeat),
                hintText: LocaleKeys.auth_confirm_password.tr(),
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                validator: confirmPasswordValidator,
              ),
              AuthCustomElevatedButton(
                onPressed: onSignUpPressed,
                height: 8.h,
                child: const Text(LocaleKeys.auth_signUp).tr(),
              ),
              AuthIsInfoValid(controller: passwordController),
            ],
          ),
        ),
      ),
    );
  }
}

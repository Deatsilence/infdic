import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/login_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/auth_custom_outlined_button.dart';
import 'package:infdic/feature/view_model/login_view_model.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:infdic/product/validation/validation.dart';
import 'package:infdic/product/widget/custom_text_form_field.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:sizer/sizer.dart';

part '../../part_of_view/part_of_login_view.dart';

/// [LoginView] is the view of login page
@RoutePage()
final class LoginView extends StatefulWidget {
  /// Constructor
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with LoginViewMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginViewModel(),
      child: Form(
        key: loginFormKey,
        child: BaseAuthView(
          onPageBuilder: (context, value) => SliverList(
            delegate: SliverChildListDelegate(
              [
                AuthSvg(
                  child: Assets.icons.icLogin.svg(package: 'gen', height: 40.h),
                ),
                const AuthTitle(title: LocaleKeys.auth_login)
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
                  prefixIcon: const Icon(Icons.password_outlined),
                  hintText: LocaleKeys.auth_password.tr(),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  validator: Validation().passwordValidator,
                ),
                const _RememberMeCheckBox(),
                _AuthRowButtons(
                  buttons: [
                    AuthCustomElevatedButton(
                      onPressed: () {},
                      height: 8.h,
                      width: 45.w,
                      child: const Text(LocaleKeys.auth_google).tr(),
                    ),
                    AuthCustomElevatedButton(
                      onPressed: onLoginPressed,
                      height: 8.h,
                      width: 45.w,
                      child: const Text(LocaleKeys.auth_login).tr(),
                    ),
                  ],
                ),
                const _AuthDivider(),
                _AuthRowButtons(
                  buttons: [
                    AuthCustomOutlinedButton(
                      onPressed: () {},
                      height: 8.h,
                      width: 45.w,
                      child: const Text(
                        LocaleKeys.general_button_forgot,
                        textAlign: TextAlign.center,
                      ).tr(),
                    ),
                    AuthCustomOutlinedButton(
                      onPressed: onSignUpPressed,
                      height: 8.h,
                      width: 45.w,
                      child: const Text(LocaleKeys.auth_signUp).tr(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

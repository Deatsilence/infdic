import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/login_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/product/navigation/app_router.dart';
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
    return Form(
      key: loginFormKey,
      child: BaseAuthView(
        onPageBuilder: (context, value) => SliverList(
          delegate: SliverChildListDelegate(
            [
              AuthSvg(
                height: 40.h,
                child: Assets.icons.icLogin.svg(package: 'gen'),
              ),
              const AuthTitle(title: LocaleKeys.auth_login)
                  .onlyPadding(top: 1.h, bottom: 1.h),
              CustomTextFormField(
                prefixIcon: const Icon(Icons.email_outlined),
                labelText: LocaleKeys.auth_email.tr(),
                keyboardType: TextInputType.emailAddress,
                validator: Validation().emailValidator,
              ),
              CustomTextFormField(
                prefixIcon: const Icon(Icons.password_outlined),
                labelText: LocaleKeys.auth_password.tr(),
                keyboardType: TextInputType.visiblePassword,
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
                  AuthCustomElevatedButton(
                    onPressed: () {},
                    height: 8.h,
                    width: 45.w,
                    child: const Text(
                      LocaleKeys.general_button_forgot,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                  AuthCustomElevatedButton(
                    onPressed: () async {
                      final response =
                          await context.router.push<bool?>(const SignUpRoute());
                      debugPrint(response.toString());
                    },
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
    );
  }
}

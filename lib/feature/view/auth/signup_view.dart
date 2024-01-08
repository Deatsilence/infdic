import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/signup_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_view.dart';
import 'package:infdic/feature/view/widget/auth_custom_outlined_button.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
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
    return BlocProvider(
      create: (context) => signUpViewModel,
      child: Form(
        key: signUpFormKey,
        child: BaseView(
          onPageBuilder: (context, value) => SliverList(
            delegate: SliverChildListDelegate(
              [
                AuthSvg(
                  child:
                      Assets.icons.icSignup.svg(package: 'gen', height: 30.h),
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
                AuthCustomElevatedButton(
                  onPressed: onSignUpPressed,
                  height: 8.h,
                  child: const Text(LocaleKeys.general_button_continue).tr(),
                ),
                AuthCustomOutlinedButton(
                  onPressed: () =>
                      context.router.push(PhoneNumberVerificationRoute()),
                  height: 8.h,
                  child: const Text(LocaleKeys.general_button_login).tr(),
                ),
              ].seperate(space: 1.h),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/login_view_mixin.dart';
import 'package:infdic/feature/view/widget/auth_custom_elevated_button.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding:
                  PaddingManager.paddingManagerNormalPaddingSymmetricHorizontal,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const _LoginSvg(),
                    const _SignInTitle().onlyPadding(top: 1.h, bottom: 1.h),
                    const _EmailAndPasswordTextFields(),
                    const _RememberMeCheckBox(),
                    const _AuthLoginButtons(),
                    const _AuthDivider(),
                    SizedBox(
                      height: 8.h,
                      width: double.infinity,
                      child: AuthCustomElevatedButton(
                        onPressed: () {},
                        child:
                            const Text(LocaleKeys.general_button_forgot).tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

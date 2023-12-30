// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:sizer/sizer.dart';

/// [OTPView] is the view of OTP
@RoutePage()
class OTPView extends StatefulWidget {
  /// [key] is the key of [OTPView]
  const OTPView({
    required this.verificationId,
    super.key,
  });

  final String verificationId;
  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.verificationId);
    return BaseAuthView(
      onPageBuilder: (context, value) => SliverList(
        delegate: SliverChildListDelegate(
          [
            Assets.icons.icSecureCode.svg(package: 'gen', height: 30.h),
            const AuthTitle(
              title: LocaleKeys.auth_verification_code,
            ).onlyPadding(
              top: 1.h,
              bottom: 1.h,
            ),
            const Text(
              LocaleKeys.auth_verification_code_body,
              textAlign: TextAlign.justify,
            ).tr(),
          ].seperate(space: 1.h),
        ),
      ),
    );
  }
}

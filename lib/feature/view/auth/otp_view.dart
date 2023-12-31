// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/otp_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_auth_view.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/feature/view_model/otp_view_model.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/state/otp_view_state.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:pinput/pinput.dart';
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

class _OTPViewState extends State<OTPView> with OTPViewMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.verificationId);
    return BlocProvider(
      create: (context) => otpViewModel,
      child: BaseAuthView(
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
              Pinput(
                onCompleted: (value) async {
                  if (value.hasValue && value.length == 6) {
                    otpViewModel.setOTPCode(otpCode: value);
                  }
                },
                length: 6,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                followingPinTheme: PinTheme(
                  height: 6.h,
                  width: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusManager.moreBorderRadius,
                    border: Border.all(
                      color: Theme.of(context).disabledColor,
                    ),
                  ),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                defaultPinTheme: PinTheme(
                  height: 6.h,
                  width: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusManager.moreBorderRadius,
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              BlocSelector<OTPViewModel, OTPViewState, String>(
                selector: (state) {
                  return state.otpCode;
                },
                builder: (context, state) {
                  return AuthCustomElevatedButton(
                    onPressed: () {
                      otpViewModel.verifyOTP(
                        userOtp: state,
                        verificationId: widget.verificationId,
                        onSuccess: (isSuccess) {
                          if (isSuccess) {
                            context.router.push(const SignUpRoute());
                          }
                        },
                      );
                    },
                    child: const Text('Verify'),
                  );
                },
              ),
            ].seperate(space: 1.h),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:common/common.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:infdic/feature/mixin/otp_view_mixin.dart';
import 'package:infdic/feature/view/auth/base_view.dart';
import 'package:infdic/feature/view/widget/index.dart';
import 'package:infdic/feature/view_model/otp_view_model.dart';
import 'package:infdic/product/init/cache/cache_manager.dart';
import 'package:infdic/product/init/language/locale_keys.g.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/state/otp_view_state.dart';
import 'package:infdic/product/utility/extension/has_value_extension.dart';
import 'package:infdic/product/utility/extension/list_gutter_extension.dart';
import 'package:infdic/product/utility/extension/padding_extension.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

part '../../part_of_view/part_of_otp_view.dart';

/// [OTPView] is the view of OTP
@RoutePage()
class OTPView extends StatefulWidget {
  /// [key] is the key of [OTPView]
  const OTPView({
    required this.verificationId,
    required this.email,
    required this.phoneNumber,
    super.key,
  });

  final String verificationId;
  final String email;
  final String phoneNumber;

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> with OTPViewMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.verificationId);
    return BlocProvider(
      create: (context) => otpViewModel,
      child: BaseView(
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
              _CustomPinput(otpViewModel: otpViewModel),
              _VerifyCustomElevatedButton(
                otpViewModel: otpViewModel,
                widget: widget,
              ),
            ].seperate(space: 1.h),
          ),
        ),
      ),
    );
  }
}

final class _VerifyCustomElevatedButton extends StatelessWidget {
  const _VerifyCustomElevatedButton({
    required this.otpViewModel,
    required this.widget,
  });

  final OTPViewModel otpViewModel;
  final OTPView widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OTPViewModel, OTPViewState>(
      builder: (context, state) {
        return AuthCustomElevatedButton(
          onPressed: () async {
            if (state.otpCode.hasValue && state.otpCode.length == 6) {
              await otpViewModel.verifyOTP(
                userOtp: state.otpCode,
                verificationId: widget.verificationId,
                onExist: (user) {
                  otpViewModel.setUser(user: user);
                  otpViewModel
                      .getUser(id: user!.uid)
                      .then(
                        (infDicUser) => CacheManager.instance
                            .setUserDataToSP(infDicUser: infDicUser),
                      )
                      .whenComplete(
                        () =>
                            CacheManager.instance.setSignInSP(isSignedIn: true),
                      )
                      .whenComplete(
                        () => context.router.pushAndPopUntil(
                          predicate: (route) =>
                              route.settings.name ==
                              PhoneNumberVerificationRoute().routeName,
                          const DictionaryRoute(),
                        ),
                      );
                },
                onNotExist: (user) {
                  otpViewModel.setUser(user: user);
                  final infDicUser = InfDicUser(
                    uId: user?.uid,
                    email: widget.email,
                    phoneNumber: widget.phoneNumber,
                    createdAt: DateTime.now(),
                  );
                  otpViewModel
                      .setStoreData(
                        infDicUser: infDicUser,
                      )
                      .whenComplete(
                        () =>
                            CacheManager.instance.setSignInSP(isSignedIn: true),
                      )
                      .whenComplete(
                        () => CacheManager.instance
                            .setUserDataToSP(infDicUser: infDicUser),
                      )
                      .whenComplete(
                        () => context.router.pushAndPopUntil(
                          predicate: (route) =>
                              route.settings.name ==
                              const SignUpRoute().routeName,
                          const DictionaryRoute(),
                        ),
                      );
                },
              );
            }
          },
          child: state.isLoading
              ? CircularProgressIndicator.adaptive(
                  backgroundColor:
                      Theme.of(context).progressIndicatorTheme.color,
                )
              : const Text(LocaleKeys.general_button_verify).tr(),
        );
      },
    );
  }
}

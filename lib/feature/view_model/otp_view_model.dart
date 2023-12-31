import 'package:flutter/material.dart';
import 'package:infdic/product/service/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/otp_view_state.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';

/// [OTPViewModel] is the view model of home page
final class OTPViewModel extends BaseCubit<OTPViewState> {
  /// Constructor
  OTPViewModel() : super(const OTPViewState(isLoading: false, otpCode: ''));

  /// [changeLoading] is the loading state of home page
  void changeLoading() {}

  /// [setOTPCode] is the OTP code of OTP page
  void setOTPCode({String? otpCode}) {
    if (!otpCode.hasValue) return;
    emit(state.copyWith(otpCode: otpCode));
  }

  Future<void> verifyOTP({
    required String verificationId,
    required String userOtp,
    required void Function(bool isSuccess) onSuccess,
  }) async {
    emit(state.copyWith(isLoading: true));
    await FirebaseNetworkManager.instance.verifyCode(
      verificationId: verificationId,
      smsCode: userOtp,
      onSuccess: onSuccess,
    );
    emit(state.copyWith(isLoading: false));
  }
}

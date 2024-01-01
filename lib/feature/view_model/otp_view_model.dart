import 'package:firebase_auth/firebase_auth.dart';
import 'package:gen/gen.dart';
import 'package:infdic/product/service/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/otp_view_state.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';

/// [OTPViewModel] is the view model of home page
final class OTPViewModel extends BaseCubit<OTPViewState> {
  /// Constructor
  OTPViewModel() : super(const OTPViewState(isLoading: false, otpCode: ''));

  /// [changeLoading] is the loading state of home page
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// [setUser] is the user of OTP page
  void setUser({User? user}) {
    if (user == null) return;
    emit(state.copyWith(user: user));
  }

  /// [setOTPCode] is the OTP code of OTP page
  void setOTPCode({String? otpCode}) {
    if (!otpCode.hasValue) return;
    emit(state.copyWith(otpCode: otpCode));
  }

  /// [verifyOTP] is the verify OTP code of OTP page
  Future<void> verifyOTP({
    required String verificationId,
    required String userOtp,
    required void Function(User? user) onExist,
    required void Function(User? user) onNotExist,
  }) async {
    changeLoading();
    await FirebaseNetworkManager.instance.verifyCode(
      verificationId: verificationId,
      smsCode: userOtp,
      onSuccess: (isSuccess, user) {
        if (isSuccess != null && isSuccess) {
          FirebaseNetworkManager.instance
              .checkExistingUser(id: user!.uid)
              .then((value) {
            if (value) {
              // TODO: user exists in our app
            } else {
              /// New user
              onNotExist(user);
            }
          });
        }
      },
    );
    changeLoading();
  }

  /// [setStoreData] is the store data of OTP page
  Future<void> setStoreData({
    required InfDicUser infDicUser,
  }) async {
    changeLoading();
    final data = infDicUser.toJson();
    await FirebaseNetworkManager.instance
        .saveUserDataToFirebase(
          infDicUser: infDicUser,
          data: data,
        )
        .whenComplete(changeLoading);
  }
}

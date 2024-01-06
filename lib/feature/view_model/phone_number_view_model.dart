import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infdic/product/service/firebase/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/phone_number_view_state.dart';

/// [PhoneNumberVerificationViewModel] is the view model of home page
final class PhoneNumberVerificationViewModel
    extends BaseCubit<PhoneNumberVerificationViewState> {
  /// Constructor
  PhoneNumberVerificationViewModel()
      : super(
          PhoneNumberVerificationViewState(
            isLoading: false,
            selectedCountry: Country(
              phoneCode: '90',
              countryCode: 'TR',
              e164Sc: 0,
              geographic: true,
              level: 1,
              name: 'Turkey',
              example: 'Turkey',
              displayName: 'Turkey',
              displayNameNoCountryCode: 'TR',
              e164Key: '',
            ),
            phoneNumber: '',
          ),
        );

  /// [changeLoading] is the loading state of phone number page
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// [selectACountry] is the selected country of phone number page
  void selectACountry(Country country) {
    emit(state.copyWith(selectedCountry: country));
  }

  /// [sendVerfiyCodeToPhone] is the selected country of phone number page
  Future<void> sendVerfiyCodeToPhone({
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
    required String phoneNumber,
  }) async {
    changeLoading();
    await FirebaseNetworkManager.instance
        .sendOTPCodeToPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        )
        .whenComplete(changeLoading);
  }
}

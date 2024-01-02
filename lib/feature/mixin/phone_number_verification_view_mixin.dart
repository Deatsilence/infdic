import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/phone_number_verification_view.dart';
import 'package:infdic/feature/view_model/phone_number_view_model.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/utility/extension/custom_string_extension.dart';

/// [PhoneNumberVerificationViewMixin] is the view model of home page
mixin PhoneNumberVerificationViewMixin on State<PhoneNumberVerificationView> {
  /// [phoneNumberFormKey] is the key of phone number form
  late final GlobalKey<FormState> _phoneNumberFormKey;

  /// [_phoneNumberController] is the controller of phone number text form field
  late final TextEditingController _phoneNumberController;

  /// [_phoneNumberVerificationViewModel] is the view model of home page
  late final PhoneNumberVerificationViewModel _phoneNumberVerificationViewModel;

  /// [phoneNumberFormKey] is the key of phone number form
  GlobalKey<FormState> get phoneNumberFormKey => _phoneNumberFormKey;

  /// [phoneNumberVerificationViewModel] is the view model of home page
  PhoneNumberVerificationViewModel get phoneNumberVerificationViewModel =>
      _phoneNumberVerificationViewModel;

  /// [phoneNumberController] is the controller of phone number text form field
  TextEditingController get phoneNumberController => _phoneNumberController;

  /// [phoneNumberValidator] is the validator of phone number text form field
  String? phoneNumberValidator(String? value) =>
      (value.hasValue) ? null : 'Please enter your phone number';

  @override
  void initState() {
    super.initState();
    _phoneNumberFormKey = GlobalKey<FormState>();
    _phoneNumberController = TextEditingController();
    _phoneNumberVerificationViewModel = PhoneNumberVerificationViewModel();
  }

  /// [onPhoneNumberPressed] is the action of phone number button
  void onPhoneNumberPressed({required Country state}) {
    if (phoneNumberFormKey.currentState != null &&
        phoneNumberFormKey.currentState!.validate()) {
      phoneNumberFormKey.currentState!.save();

      final phoneNumber = phoneNumberController.text.trim();
      phoneNumberVerificationViewModel.sendVerfiyCodeToPhone(
        phoneNumber: '+${state.phoneCode}$phoneNumber',
        verificationCompleted: (p0) => debugPrint(p0.toString()),
        // context.router.push(const SignUpRoute()),
        codeSent: (verificationId, code) {
          debugPrint('code: $code');
          context.router.push(
            OTPRoute(
              verificationId: verificationId,
              email: widget.email ?? '',
              phoneNumber: phoneNumber,
            ),
          );
        },
        verificationFailed: (p0) {
          debugPrint(p0.message);
        },
        codeAutoRetrievalTimeout: (p0) {
          debugPrint(p0);
        },
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/phone_number_verification_view.dart';
import 'package:infdic/feature/view_model/phone_number_view_model.dart';

/// [PhoneNumberVerificationViewMixin] is the view model of home page
mixin PhoneNumberVerificationViewMixin on State<PhoneNumberVerificationView> {
  /// [_phoneNumberController] is the controller of phone number text form field
  late final TextEditingController _phoneNumberController;

  /// [_phoneNumberVerificationViewModel] is the view model of home page
  late final PhoneNumberVerificationViewModel _phoneNumberVerificationViewModel;

  /// [phoneNumberVerificationViewModel] is the view model of home page
  PhoneNumberVerificationViewModel get phoneNumberVerificationViewModel =>
      _phoneNumberVerificationViewModel;

  /// [phoneNumberController] is the controller of phone number text form field
  TextEditingController get phoneNumberController => _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _phoneNumberVerificationViewModel = PhoneNumberVerificationViewModel();
  }
}

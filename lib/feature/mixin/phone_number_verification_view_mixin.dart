import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/phone_number_verification_view.dart';
import 'package:infdic/feature/view_model/phone_number_view_model.dart';

/// [PhoneNumberVerificationViewMixin] is the view model of home page
mixin PhoneNumberVerificationViewMixin on State<PhoneNumberVerificationView> {
  /// [_phoneNumberVerificationViewModel] is the view model of home page
  late final PhoneNumberVerificationViewModel _phoneNumberVerificationViewModel;

  /// [phoneNumberVerificationViewModel] is the view model of home page
  PhoneNumberVerificationViewModel get phoneNumberVerificationViewModel =>
      _phoneNumberVerificationViewModel;

  @override
  void initState() {
    super.initState();
    _phoneNumberVerificationViewModel = PhoneNumberVerificationViewModel();
  }
}

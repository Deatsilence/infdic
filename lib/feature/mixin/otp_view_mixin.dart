import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/otp_view.dart';
import 'package:infdic/feature/view_model/otp_view_model.dart';

/// [OTPViewMixin] is the view model of home page
mixin OTPViewMixin on State<OTPView> {
  /// [_phoneNumberController] is the controller of phone number text form field
  late final TextEditingController _phoneNumberController;

  /// [_otpViewModel] is the view model of home page
  late final OTPViewModel _otpViewModel;

  /// [otpViewModel] is the view model of home page
  OTPViewModel get otpViewModel => _otpViewModel;

  /// [phoneNumberController] is the controller of phone number text form field
  TextEditingController get phoneNumberController => _phoneNumberController;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _otpViewModel = OTPViewModel();
  }
}

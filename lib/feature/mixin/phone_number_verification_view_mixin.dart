import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/phone_number_verification_view.dart';

/// [PhoneNumberVerificationViewMixin] is logics of phone number verification view
mixin PhoneNumberVerificationViewMixin on State<PrefixPhoneNumberPicker> {
  /// [selectedCountry] is controller for phone number field
  Country selectedCountry = Country(
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
  );
}

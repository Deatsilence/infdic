import 'package:country_picker/country_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infdic/product/state/phone_number_view_state.dart';

/// [PhoneNumberVerificationViewModel] is the view model of home page
final class PhoneNumberVerificationViewModel
    extends Cubit<PhoneNumberVerificationViewState> {
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
          ),
        );

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// [selectACountry] is the selected country of phone number page
  void selectACountry(Country country) {
    emit(state.copyWith(selectedCountry: country));
  }
}
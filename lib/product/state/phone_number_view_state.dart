import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';

/// [PhoneNumberVerificationViewState] is the view state of phone number page
final class PhoneNumberVerificationViewState extends Equatable {
  /// Constructor
  const PhoneNumberVerificationViewState({
    required this.isLoading,
    required this.selectedCountry,
    required this.phoneNumber,
  });

  /// [isLoading] is the loading state of phone number page
  final bool isLoading;

  /// [selectedCountry] is the selected country of phone number page
  final Country selectedCountry;

  /// [phoneNumber] is the phone number of phone number page
  final String phoneNumber;

  @override
  List<Object?> get props => [isLoading, selectedCountry, phoneNumber];

  /// [copyWith] is the copy of [PhoneNumberVerificationViewState]
  PhoneNumberVerificationViewState copyWith({
    bool? isLoading,
    Country? selectedCountry,
    String? phoneNumber,
  }) {
    return PhoneNumberVerificationViewState(
      isLoading: isLoading ?? this.isLoading,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}

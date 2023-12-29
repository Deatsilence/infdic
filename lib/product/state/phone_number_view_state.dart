import 'package:country_picker/country_picker.dart';
import 'package:equatable/equatable.dart';

/// [PhoneNumberVerificationViewState] is the view state of phone number page
final class PhoneNumberVerificationViewState extends Equatable {
  /// Constructor
  const PhoneNumberVerificationViewState({
    required this.isLoading,
    required this.selectedCountry,
  });

  /// [isLoading] is the loading state of phone number page
  final bool isLoading;

  /// [selectedCountry] is the selected country of phone number page
  final Country selectedCountry;

  @override
  List<Object?> get props => [isLoading, selectedCountry];

  /// [copyWith] is the copy of [PhoneNumberVerificationViewState]
  PhoneNumberVerificationViewState copyWith({
    bool? isLoading,
    Country? selectedCountry,
  }) {
    return PhoneNumberVerificationViewState(
      isLoading: isLoading ?? this.isLoading,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}

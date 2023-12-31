import 'package:equatable/equatable.dart';

/// [OTPViewState] is the view state of OTP page
final class OTPViewState extends Equatable {
  /// Constructor
  const OTPViewState({required this.isLoading, required this.otpCode});

  /// [isLoading] is the loading state of OTP page
  final bool isLoading;

  /// [otpCode] is the OTP code of OTP page
  final String otpCode;

  @override
  List<Object?> get props => [isLoading, otpCode];

  /// [copyWith] is the copy of [OTPViewState]

  OTPViewState copyWith({
    bool? isLoading,
    String? otpCode,
  }) {
    return OTPViewState(
      isLoading: isLoading ?? this.isLoading,
      otpCode: otpCode ?? this.otpCode,
    );
  }
}

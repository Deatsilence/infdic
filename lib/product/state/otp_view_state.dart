import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// [OTPViewState] is the view state of OTP page
final class OTPViewState extends Equatable {
  /// Constructor
  const OTPViewState({
    required this.isLoading,
    required this.otpCode,
    this.user,
  });

  /// [isLoading] is the loading state of OTP page
  final bool isLoading;

  /// [otpCode] is the OTP code of OTP page
  final String otpCode;

  /// [user] is the user of OTP page
  final User? user;

  @override
  List<Object?> get props => [isLoading, otpCode, user];

  /// [copyWith] is the copy of [OTPViewState]

  OTPViewState copyWith({
    bool? isLoading,
    String? otpCode,
    User? user,
  }) {
    return OTPViewState(
      isLoading: isLoading ?? this.isLoading,
      otpCode: otpCode ?? this.otpCode,
      user: user ?? this.user,
    );
  }
}

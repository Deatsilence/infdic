import 'package:equatable/equatable.dart';

/// [SignUpViewState] is the view state of sign up page
final class SignUpViewState extends Equatable {
  /// Constructor
  const SignUpViewState({this.isLoading = false});

  /// [isLoading] is the loading state of sign up page
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  /// [copyWith] is the copy of [SignUpViewState]
  SignUpViewState copyWith({
    bool? isLoading,
  }) {
    return SignUpViewState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

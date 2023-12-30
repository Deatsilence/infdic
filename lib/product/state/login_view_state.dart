import 'package:equatable/equatable.dart';

/// [LoginViewState] is the view state of home page
final class LoginViewState extends Equatable {
  /// Constructor
  const LoginViewState({this.isLoading = false, this.isSignedIn = false});

  /// [isLoading] is the loading state of home page
  final bool isLoading;

  /// [isSignedIn] is the signed in state of home page
  final bool isSignedIn;

  @override
  List<Object?> get props => [isLoading, isSignedIn];

  /// [copyWith] is the copy of [LoginViewState]
  LoginViewState copyWith({
    bool? isLoading,
    bool? isSignedIn,
  }) {
    return LoginViewState(
      isLoading: isLoading ?? this.isLoading,
      isSignedIn: isSignedIn ?? this.isSignedIn,
    );
  }
}

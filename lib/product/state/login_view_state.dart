import 'package:equatable/equatable.dart';

/// [LoginViewState] is the view state of home page
final class LoginViewState extends Equatable {
  /// Constructor
  const LoginViewState({required this.isLoading});

  /// [isLoading] is the loading state of home page
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  /// [copyWith] is the copy of [LoginViewState]
  LoginViewState copyWith({
    bool? isLoading,
  }) {
    return LoginViewState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

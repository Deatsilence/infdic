import 'package:equatable/equatable.dart';

/// [SignUpViewState] is the view state of home page
final class SignUpViewState extends Equatable {
  /// Constructor
  const SignUpViewState({this.isLoading = false});

  /// [isLoading] is the loading state of home page
  final bool isLoading;

  @override
  List<Object?> get props => [
        isLoading,
      ];

  /// [copyWith] is the copy of [SignUpViewState]
  SignUpViewState copyWith({
    bool? isLoading,
  }) {
    return SignUpViewState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

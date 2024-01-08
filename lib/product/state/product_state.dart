import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [ProductState] is the view state of product
final class ProductState extends Equatable {
  /// Constructor
  const ProductState({
    required this.isLoading,
    required this.themeMode,
    required this.isSignedIn,
  });

  /// [isLoading] is the loading state of home page
  final bool isLoading;

  /// [themeMode] is the theme mode of product
  final ThemeMode themeMode;

  /// [isSignedIn] is the signed in state of home page
  final bool isSignedIn;

  @override
  List<Object?> get props => [themeMode, isSignedIn, isLoading];

  /// [copyWith] is the copy of [ProductState]
  ProductState copyWith({
    ThemeMode? themeMode,
    bool? isSignedIn,
    bool? isLoading,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

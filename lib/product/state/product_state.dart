import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// [ProductState] is the view state of product
final class ProductState extends Equatable {
  /// Constructor
  const ProductState({this.themeMode = ThemeMode.light});

  /// [themeMode] is the theme mode of product
  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  /// [copyWith] is the copy of [ProductState]
  ProductState copyWith({
    ThemeMode? themeMode,
  }) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

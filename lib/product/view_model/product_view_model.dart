import 'package:flutter/material.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/product_state.dart';

/// [ProductViewModel] is the view model of product
final class ProductViewModel extends BaseCubit<ProductState> {
  /// Constructor
  ProductViewModel() : super(const ProductState());

  /// [changeThemeMode] is the theme mode of product
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }
}

import 'package:flutter/material.dart';
import 'package:infdic/product/init/cache/cache_manager.dart';
import 'package:infdic/product/service/firebase/firebase_network_manager.dart';
import 'package:infdic/product/state/base/base_cubit.dart';
import 'package:infdic/product/state/product_state.dart';

/// [ProductViewModel] is the view model of product
final class ProductViewModel extends BaseCubit<ProductState> {
  /// Constructor
  ProductViewModel()
      : super(
          const ProductState(
            isLoading: false,
            isSignedIn: false,
            themeMode: ThemeMode.light,
          ),
        );

  /// [changeLoading] is the loading state of home page
  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  /// [checkSignIn] is the signed in state of home page
  Future<void> checkSignIn() async {
    await CacheManager.instance.checkSignInSP().then(
          (value) => emit(
            state.copyWith(isSignedIn: value),
          ),
        );
  }

  /// [changeThemeMode] is the theme mode of product
  /// [themeMode] is [ThemeMode.light] or [ThemeMode.dark]
  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  /// [userSignOut] is the sign in of product
  Future<void> userSignOut() async {
    await FirebaseNetworkManager.instance.signOut();
    await CacheManager.instance.clearSP();
    emit(state.copyWith(isSignedIn: false));
  }
}

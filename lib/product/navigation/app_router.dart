import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/otp_view.dart';
import 'package:infdic/feature/view/auth/phone_number_verification_view.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';
import 'package:infdic/feature/view/dictionary_view.dart';
import 'package:infdic/feature/view/home_view.dart';

part 'app_router.gr.dart';

/// [AppRouter] is the router of the app
@AutoRouterConfig(replaceInRouteName: AppRouter._replaceInRouteName)
final class AppRouter extends _$AppRouter {
  static const _replaceInRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: PhoneNumberVerificationRoute.page),
        AutoRoute(page: OTPRoute.page),
        AutoRoute(page: DictionaryRoute.page),
      ];
}

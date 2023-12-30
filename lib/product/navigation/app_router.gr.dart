// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginView(),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPView(
          verificationId: args.verificationId,
          key: args.key,
        ),
      );
    },
    PhoneNumberVerificationRoute.name: (routeData) {
      return AutoRoutePage<bool?>(
        routeData: routeData,
        child: const PhoneNumberVerificationView(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<bool?>(
        routeData: routeData,
        child: const SignUpView(),
      );
    },
  };
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginView]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OTPView]
class OTPRoute extends PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    required String verificationId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            verificationId: verificationId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPRoute';

  static const PageInfo<OTPRouteArgs> page = PageInfo<OTPRouteArgs>(name);
}

class OTPRouteArgs {
  const OTPRouteArgs({
    required this.verificationId,
    this.key,
  });

  final String verificationId;

  final Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{verificationId: $verificationId, key: $key}';
  }
}

/// generated route for
/// [PhoneNumberVerificationView]
class PhoneNumberVerificationRoute extends PageRouteInfo<void> {
  const PhoneNumberVerificationRoute({List<PageRouteInfo>? children})
      : super(
          PhoneNumberVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhoneNumberVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpView]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

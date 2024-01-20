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
    DictionaryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DictionaryView(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    OTPRoute.name: (routeData) {
      final args = routeData.argsAs<OTPRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OTPView(
          verificationId: args.verificationId,
          email: args.email,
          phoneNumber: args.phoneNumber,
          key: args.key,
        ),
      );
    },
    OwnDictionaryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OwnDictionaryView(),
      );
    },
    PhoneNumberVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<PhoneNumberVerificationRouteArgs>(
          orElse: () => const PhoneNumberVerificationRouteArgs());
      return AutoRoutePage<bool?>(
        routeData: routeData,
        child: PhoneNumberVerificationView(
          email: args.email,
          key: args.key,
        ),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootView(),
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
/// [DictionaryView]
class DictionaryRoute extends PageRouteInfo<void> {
  const DictionaryRoute({List<PageRouteInfo>? children})
      : super(
          DictionaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DictionaryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
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
/// [OTPView]
class OTPRoute extends PageRouteInfo<OTPRouteArgs> {
  OTPRoute({
    required String verificationId,
    required String email,
    required String phoneNumber,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OTPRoute.name,
          args: OTPRouteArgs(
            verificationId: verificationId,
            email: email,
            phoneNumber: phoneNumber,
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
    required this.email,
    required this.phoneNumber,
    this.key,
  });

  final String verificationId;

  final String email;

  final String phoneNumber;

  final Key? key;

  @override
  String toString() {
    return 'OTPRouteArgs{verificationId: $verificationId, email: $email, phoneNumber: $phoneNumber, key: $key}';
  }
}

/// generated route for
/// [OwnDictionaryView]
class OwnDictionaryRoute extends PageRouteInfo<void> {
  const OwnDictionaryRoute({List<PageRouteInfo>? children})
      : super(
          OwnDictionaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OwnDictionaryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PhoneNumberVerificationView]
class PhoneNumberVerificationRoute
    extends PageRouteInfo<PhoneNumberVerificationRouteArgs> {
  PhoneNumberVerificationRoute({
    String? email,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PhoneNumberVerificationRoute.name,
          args: PhoneNumberVerificationRouteArgs(
            email: email,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PhoneNumberVerificationRoute';

  static const PageInfo<PhoneNumberVerificationRouteArgs> page =
      PageInfo<PhoneNumberVerificationRouteArgs>(name);
}

class PhoneNumberVerificationRouteArgs {
  const PhoneNumberVerificationRouteArgs({
    this.email,
    this.key,
  });

  final String? email;

  final Key? key;

  @override
  String toString() {
    return 'PhoneNumberVerificationRouteArgs{email: $email, key: $key}';
  }
}

/// generated route for
/// [RootView]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

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

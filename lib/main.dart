import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/auth/login_view.dart';
import 'package:infdic/feature/view/auth/signup_view.dart';
import 'package:infdic/product/init/application_initialize.dart';
import 'package:infdic/product/init/product_localization.dart';
import 'package:infdic/product/init/theme/custom_dark_theme.dart';
import 'package:infdic/product/init/theme/custom_light_theme.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(ProductLocalization(child: const MyApp()));
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: 'Material App',
        theme: CustomLightTheme().themeData,
        darkTheme: CustomDarkTheme().themeData,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SignUpView(),
      ),
    );
  }
}

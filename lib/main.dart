import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/product/init/application_initialize.dart';
import 'package:infdic/product/init/product_localization.dart';
import 'package:infdic/product/init/state_initialize.dart';
import 'package:infdic/product/init/theme/custom_dark_theme.dart';
import 'package:infdic/product/init/theme/custom_light_theme.dart';
import 'package:infdic/product/navigation/app_router.dart';
import 'package:infdic/product/utility/constants/information_of_app.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  await ApplicationInitialize().make();

  runApp(ProductLocalization(child: const MyApp()));
}

/// This is the main application widget.
final class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  const MyApp({super.key});
  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => StateInitialize(
        child: MaterialApp.router(
          title: InformationOfApp.appName,
          theme: CustomLightTheme().themeData,
          darkTheme: CustomDarkTheme().themeData,
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            ...context.localizationDelegates,
            CountryLocalizations.delegate,
          ],
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:infdic/feature/view/login_view.dart';
import 'package:infdic/product/init/product_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ProductLocalization(child: const MyApp()));
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const LoginView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

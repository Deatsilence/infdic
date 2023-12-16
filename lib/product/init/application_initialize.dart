import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

@immutable

/// [ApplicationInitialize] is a class that is used to
/// initialize the application process.
final class ApplicationInitialize {
  /// [make] is a method that can catch errors that occur while initializing
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(_initialize, (error, stack) {
      Logger().e(error);
    });
  }

  /// [_initialize] is a method that is used to initialize
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];

    /// Firebase initialization will come here.

    /// The application's a few settings are set here.
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    /// [FlutterError.onError] is used to catch errors that occur
    // TODO will be added as custom error
    // FlutterError.onError = (details) {
    //   Logger().e(details.exceptionAsString());
    // };

    /// Dependency injection will come here.
    /// envied will come here.
  }
}

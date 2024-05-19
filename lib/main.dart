import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:madini/app.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  await runZonedGuarded(
    () async {
      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      // Retain native splash screen until Dart is ready
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
      ErrorWidget.builder = (FlutterErrorDetails error) {
        Zone.current.handleUncaughtError(error.exception, error.stack!);
        return ErrorWidget(error.exception);
      };

      runApp(const App());
      FlutterNativeSplash.remove(); // Now remove splash screen
    },
    (exception, stackTrace) {
      //FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    },
  );
}





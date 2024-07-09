import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:madini/app.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure this is the first line

  // Load encrypted assets
  // await loadEncryptAsset();


      runApp(const App());

}




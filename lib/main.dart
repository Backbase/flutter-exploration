import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:flutter/material.dart';
import 'package:mobile_foundation_headless_flutter/app.dart';
import 'di/modules_di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupAppModules();
  runApp(const App());
}

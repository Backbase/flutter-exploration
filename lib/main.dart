import 'package:flutter/material.dart';
import 'package:mobile_foundation_headless_flutter/app.dart';
import 'di/modules_di.dart';
void main() {
  setupAppModules();
  runApp(const App());
}

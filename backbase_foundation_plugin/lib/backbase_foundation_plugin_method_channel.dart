import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'backbase_foundation_plugin_platform_interface.dart';

/// An implementation of [BackbaseFoundationPluginPlatform] that uses method channels.
class MethodChannelBackbaseFoundationPlugin extends BackbaseFoundationPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('backbase_foundation_plugin');

  @override
  Future<String?> getToken() async {
    return await methodChannel.invokeMethod<String>('getToken');
  }
}

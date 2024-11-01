import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'backbase_foundation_plugin_platform_interface.dart';

/// An implementation of [BackbaseFoundationPluginPlatform] that uses method channels.
class MethodChannelBackbaseFoundationPlugin extends BackbaseFoundationPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('backbase_foundation_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> authenticate(String username, String password) async {
    return await methodChannel.invokeMethod<String>('authenticate', {"username": username, "password": password});
  }
  @override
  Future<String?> enterPasscode(String passcode) async {
    return await methodChannel.invokeMethod<String>('enterPasscode', {"passcode": passcode});
  }
}

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'backbase_foundation_plugin_method_channel.dart';

abstract class BackbaseFoundationPluginPlatform extends PlatformInterface {
  /// Constructs a BackbaseFoundationPluginPlatform.
  BackbaseFoundationPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static BackbaseFoundationPluginPlatform _instance = MethodChannelBackbaseFoundationPlugin();

  /// The default instance of [BackbaseFoundationPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelBackbaseFoundationPlugin].
  static BackbaseFoundationPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BackbaseFoundationPluginPlatform] when
  /// they register themselves.
  static set instance(BackbaseFoundationPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
  }
  Future<String?> authenticate(String username,String password) async{
    return await _instance.authenticate(username,password);
  }

  Future<String?> enterPasscode(String passcode) {
    return _instance.enterPasscode(passcode);
  }
}

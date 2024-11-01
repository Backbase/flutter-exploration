
import 'backbase_foundation_plugin_platform_interface.dart';

class BackbaseFoundationPlugin {
  Future<String?> getPlatformVersion() {
    return BackbaseFoundationPluginPlatform.instance.getPlatformVersion();
  }
  Future<String?> authenticate(String username,String password) async{
    return await BackbaseFoundationPluginPlatform.instance.authenticate(username, password);
  }

  Future<String?> enterPasscode(String passcode) {
    return BackbaseFoundationPluginPlatform.instance.enterPasscode(passcode);
  }

}

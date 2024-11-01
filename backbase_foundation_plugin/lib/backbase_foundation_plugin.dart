
import 'backbase_foundation_plugin_platform_interface.dart';

class BackbaseFoundationPlugin {
  Future<String?> getToken() {
    return BackbaseFoundationPluginPlatform.instance.getToken();
  }
}

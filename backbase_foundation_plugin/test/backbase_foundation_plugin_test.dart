import 'package:flutter_test/flutter_test.dart';
import 'package:backbase_foundation_plugin/backbase_foundation_plugin.dart';
import 'package:backbase_foundation_plugin/backbase_foundation_plugin_platform_interface.dart';
import 'package:backbase_foundation_plugin/backbase_foundation_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBackbaseFoundationPluginPlatform
    with MockPlatformInterfaceMixin
    implements BackbaseFoundationPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> authenticate(String username, String password) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<String?> enterPasscode(String passcode) {
    // TODO: implement enterPasscode
    throw UnimplementedError();
  }
}

void main() {
  final BackbaseFoundationPluginPlatform initialPlatform = BackbaseFoundationPluginPlatform.instance;

  test('$MethodChannelBackbaseFoundationPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBackbaseFoundationPlugin>());
  });

  test('getPlatformVersion', () async {
    BackbaseFoundationPlugin backbaseFoundationPlugin = BackbaseFoundationPlugin();
    MockBackbaseFoundationPluginPlatform fakePlatform = MockBackbaseFoundationPluginPlatform();
    BackbaseFoundationPluginPlatform.instance = fakePlatform;

    expect(await backbaseFoundationPlugin.getPlatformVersion(), '42');
  });
}

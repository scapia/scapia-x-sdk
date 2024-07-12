import 'package:flutter_test/flutter_test.dart';
import 'package:scapia_x_sdk/scapia_x_sdk.dart';
import 'package:scapia_x_sdk/scapia_X_sdk_platform_interface.dart';
import 'package:scapia_x_sdk/scapia_x_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockScapiaXSdkPlatform
    with MockPlatformInterfaceMixin
    implements ScapiaXSdkPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ScapiaXSdkPlatform initialPlatform = ScapiaXSdkPlatform.instance;

  test('$MethodChannelScapiaXSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelScapiaXSdk>());
  });

  test('getPlatformVersion', () async {
    ScapiaXSdk scapiaXSdkPlugin = ScapiaXSdk();
    MockScapiaXSdkPlatform fakePlatform = MockScapiaXSdkPlatform();
    ScapiaXSdkPlatform.instance = fakePlatform;

    expect(await scapiaXSdkPlugin.getPlatformVersion(), '42');
  });
}

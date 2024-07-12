import 'scapia_x_sdk_platform_interface.dart';

class ScapiaXSdk {
  Future<String?> getPlatformVersion() {
    return ScapiaXSdkPlatform.instance.getPlatformVersion();
  }
}

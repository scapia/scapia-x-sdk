import 'scapia_X_sdk_platform_interface.dart';

class ScapiaXSdk {
  Future<String?> getPlatformVersion() {
    return ScapiaXSdkPlatform.instance.getPlatformVersion();
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'scapia_x_sdk_platform_interface.dart';

/// An implementation of [ScapiaXSdkPlatform] that uses method channels.
class MethodChannelScapiaXSdk extends ScapiaXSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('scapia_x_sdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

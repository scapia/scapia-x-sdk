import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:scapia_x_sdk/scapia_x_sdk_method_channel.dart';

abstract class ScapiaXSdkPlatform extends PlatformInterface {
  /// Constructs a ScapiaXSdkPlatform.
  ScapiaXSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScapiaXSdkPlatform _instance = MethodChannelScapiaXSdk();

  /// The default instance of [ScapiaXSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelScapiaXSdk].
  static ScapiaXSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScapiaXSdkPlatform] when
  /// they register themselves.
  static set instance(ScapiaXSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

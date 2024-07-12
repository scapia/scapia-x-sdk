import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:bank_base_sdk/base/base_service.dart';
import 'package:dio/dio.dart';
import 'package:scapia_x_sdk/scapia_x_sdk_controller.dart';
import 'package:scapia_x_sdk/utils/constants.dart';

abstract class ScapiaXBaseService extends BaseService {
  @override
  String get baseUrl => ScapiaXSdkController.instance.environment == kSandbox
      ? kSandboxBaseUrl
      : kProductionBaseUrl;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // TODO: add the event for session stop

    super.onRequest(options, handler);
    options.headers = this.options.headers;

    /// If is MPIN screen shown then wait for it to be dismissed
    /// and then send the request
    // if(ScapiaXSdkController.instance.isMpinScreenShown) {
    //   return handler.next(options);
    // } else {
    return handler.next(options);
    // }
  }

  @override
  Future<void> onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    // TODO: add the event for session reset

    super.onError(error, handler);
  }

  @override
  bool isSecuredApi(String path) {
    // TODO: handle secured apis
    return false;
  }

  @override
  Future<void> triggerMpinFlow() async {
    // TODO: implement triggerMpinFlow
  }

  @override
  BaseOptions get options {
    var options = BaseOptions();
    options.baseUrl = baseUrl;
    options.connectTimeout = const Duration(seconds: 120);
    options.receiveTimeout = const Duration(seconds: 120);
    options.contentType = Headers.jsonContentType;
    return options;
  }
}

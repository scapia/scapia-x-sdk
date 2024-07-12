import 'package:bank_base_sdk/utils/analytics/analytics_interface.dart';
import 'package:bank_base_sdk/utils/analytics/send_analytics_event.dart';
import 'package:bank_base_sdk/utils/models/analytics_scapia_event.model.dart';
import 'package:scapia_x_sdk/scapia_x_sdk_controller.dart';

mixin AnalyticsMixin on AnalyticsInterface {
  @override
  void sendEvent(SendAnalyticsEvent event) {
    ScapiaXSdkController.instance.sendEventToScapia(
      event: AnalyticsScapiaEvent.fromSendAnalyticsEvent(event),
    );
  }
}

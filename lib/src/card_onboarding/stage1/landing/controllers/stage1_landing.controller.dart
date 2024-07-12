import 'package:bank_base_sdk/card_onboarding/stage1/stage1.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:scapia_x_sdk/utils/analytics/analytics_mixin.dart';
import 'package:scapia_x_sdk/utils/navigation/routes.dart';

class Stage1LandingController extends Stage1LandingInterface
    with AnalyticsMixin {
  @override
  void onCtaClicked() {
    super.onCtaClicked();
    Get.offAllNamed(
      Routes.panInput,
      arguments: {
        "nameOnPan": GetIt.instance
                .get<Stage1Bloc>()
                .request
                .cardOnboardDetails
                .nameOnPanCard ??
            '',
      },
    );
  }
}

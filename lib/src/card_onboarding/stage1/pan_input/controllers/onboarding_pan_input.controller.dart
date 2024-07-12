import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:get/get.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_input/services/onboarding_pan_input.service.dart';
import 'package:scapia_x_sdk/utils/analytics/analytics_mixin.dart';
import 'package:scapia_x_sdk/utils/navigation/routes.dart';

class OnboardingPanInputController extends CardOnboardingPanInterface
    with AnalyticsMixin {
  OnboardingPanInputController() {
    _onboardingPanInputService = OnboardingPanInputService();
  }

  late OnboardingPanInputService _onboardingPanInputService;

  @override
  Future<VerifyPanResponseV2> verifyPanV2(VerifyPanRequestV2 request) async {
    try {
      return _onboardingPanInputService.verifyPanV2(request);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void navigateToPanVerificationScreen(VerifyPanResponseV2 res) {
    Get.offAllNamed(
      Routes.panVerified,
      arguments: {
        "verifyPanResponse": res,
      },
    );
  }
}

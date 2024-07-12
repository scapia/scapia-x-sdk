import 'package:bank_base_sdk/card_onboarding/stage1/pan_verified/interfaces/onboarding_pan_verified.interface.dart';
import 'package:scapia_x_sdk/src/card_onboarding/network/onboarding_service.dart';
import 'package:scapia_x_sdk/utils/analytics/analytics_mixin.dart';

class OnboardingPanVerificationController extends OnboardingPanVerifiedInterface
    with AnalyticsMixin {
  OnboardingPanVerificationController();

  late OnboardingService onboardingService;
}

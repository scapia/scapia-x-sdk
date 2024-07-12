import 'package:bank_base_sdk/card_onboarding/stage1/pan_input/models/verify_pan_request_v2.model.dart';
import 'package:bank_base_sdk/card_onboarding/stage1/pan_input/models/verify_pan_response_v2.model.dart';
import 'package:bank_base_sdk/card_onboarding/stage1/pan_verified/interfaces/onboarding_edit_pan_bottom_sheet.interface.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_input/services/onboarding_pan_input.service.dart';
import 'package:scapia_x_sdk/utils/analytics/analytics_mixin.dart';

class OnboardingEditPanBottomSheetController
    extends OnboardingEditPanBottomSheetInterface with AnalyticsMixin {
  OnboardingEditPanBottomSheetController() {
    _onboardingPanInputService = OnboardingPanInputService();
  }

  late OnboardingPanInputService _onboardingPanInputService;

  @override
  Future<VerifyPanResponseV2> verifyPanV2(VerifyPanRequestV2 request) {
    try {
      return _onboardingPanInputService.verifyPanV2(request);
    } catch (e) {
      rethrow;
    }
  }
}

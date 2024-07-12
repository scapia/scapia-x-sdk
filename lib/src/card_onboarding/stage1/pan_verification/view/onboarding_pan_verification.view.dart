import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:flutter/material.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_verification/controllers/onboarding_edit_pan_bottom_sheet.controller.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_verification/controllers/onboarding_pan_verification.controller.dart';

class OnboardingPanVerification extends StatelessWidget {
  const OnboardingPanVerification({
    super.key,
    required this.response,
  });

  final VerifyPanResponseV2 response;

  @override
  Widget build(BuildContext context) {
    return OnboardingPanVerifiedScreen(
      panVerificationInterface: OnboardingPanVerificationController(),
      editPanBottomSheetInterface: OnboardingEditPanBottomSheetController(),
      response: response,
    );
  }
}

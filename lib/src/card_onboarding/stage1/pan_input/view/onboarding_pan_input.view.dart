import 'package:bank_base_sdk/card_onboarding/stage1/pan_input/onboarding_pan_input.dart';
import 'package:flutter/material.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_input/controllers/onboarding_pan_input.controller.dart';

class OnboardingPanInput extends StatelessWidget {
  final String nameOnPan;

  const OnboardingPanInput({
    super.key,
    required this.nameOnPan,
  });

  @override
  Widget build(BuildContext context) {
    return OnboardingPanInputTemplate(
      nameOnPan: nameOnPan,
      cardOnboardingPanInterface: OnboardingPanInputController(),
    );
  }
}

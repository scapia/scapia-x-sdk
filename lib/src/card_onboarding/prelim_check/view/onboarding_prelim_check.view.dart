import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:flutter/material.dart';
import 'package:scapia_x_sdk/src/card_onboarding/prelim_check/controllers/onboarding_prelim_check.controller.dart';

class OnboardingPrelimCheckView extends StatelessWidget {
  const OnboardingPrelimCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingPreliminaryCheckTemplate(
      onboardingPrelimCheckInterface: OnboardingPrelimCheckController(),
    );
  }
}

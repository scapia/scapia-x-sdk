import 'package:bank_base_sdk/card_onboarding/stage1/landing/stage1_landing.dart';
import 'package:flutter/material.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/landing/controllers/stage1_landing.controller.dart';

class Stage1LandingView extends StatelessWidget {
  const Stage1LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stage1LandingTemplate(
      stage1landingInterface: Stage1LandingController(),
    );
  }
}

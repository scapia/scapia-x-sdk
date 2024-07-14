import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:flutter/material.dart';
import 'package:scapia_x_sdk/src/card_onboarding/handoff/controllers/handoff_verification.controller.dart';

class HandoffVerification extends StatelessWidget {
  const HandoffVerification({
    super.key,
    required this.handOffVerificationRequest,
  });

  final HandOffVerificationRequest handOffVerificationRequest;

  @override
  Widget build(BuildContext context) {
    return HandoffVerificationTemplate(
      handoffVerificationInterface: HandoffVerificationController(
        handOffVerificationRequest: handOffVerificationRequest,
      ),
    );
  }
}

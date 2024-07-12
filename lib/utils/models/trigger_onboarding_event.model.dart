import 'package:bank_base_sdk/card_onboarding/handoff/models/handoff_verification_request.model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scapia_x_sdk/utils/enums.dart';
import 'package:scapia_x_sdk/utils/models/bank_event.model.dart';

part 'trigger_onboarding_event.model.g.dart';

@JsonSerializable()
class TriggerOnboardingEvent extends BankEvent {
  TriggerOnboardingEvent({
    super.eventType = BankEventType.triggerOnboarding,
    required this.handoffVerifyInfo,
  });

  final HandOffVerificationRequest handoffVerifyInfo;

  factory TriggerOnboardingEvent.fromJson(Map<String, dynamic> json) =>
      _$TriggerOnboardingEventFromJson(json);
}

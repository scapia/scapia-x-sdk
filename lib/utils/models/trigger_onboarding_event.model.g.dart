// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trigger_onboarding_event.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TriggerOnboardingEvent _$TriggerOnboardingEventFromJson(
        Map<String, dynamic> json) =>
    TriggerOnboardingEvent(
      eventType:
          $enumDecodeNullable(_$BankEventTypeEnumMap, json['eventType']) ??
              BankEventType.triggerOnboarding,
      handoffVerifyInfo: HandOffVerificationRequest.fromJson(
          json['handoffVerifyInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TriggerOnboardingEventToJson(
        TriggerOnboardingEvent instance) =>
    <String, dynamic>{
      'eventType': _$BankEventTypeEnumMap[instance.eventType]!,
      'handoffVerifyInfo': instance.handoffVerifyInfo.toJson(),
    };

const _$BankEventTypeEnumMap = {
  BankEventType.triggerOnboarding: 'triggerOnboarding',
  BankEventType.refreshCardHome: 'refreshCardHome',
};

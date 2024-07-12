// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_event.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankEvent _$BankEventFromJson(Map<String, dynamic> json) => BankEvent(
      eventType: $enumDecode(_$BankEventTypeEnumMap, json['eventType']),
    );

Map<String, dynamic> _$BankEventToJson(BankEvent instance) => <String, dynamic>{
      'eventType': _$BankEventTypeEnumMap[instance.eventType]!,
    };

const _$BankEventTypeEnumMap = {
  BankEventType.triggerOnboarding: 'triggerOnboarding',
  BankEventType.refreshCardHome: 'refreshCardHome',
};

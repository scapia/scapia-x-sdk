import 'package:json_annotation/json_annotation.dart';
import 'package:scapia_x_sdk/utils/enums.dart';
part 'bank_event.model.g.dart';

@JsonSerializable()
class BankEvent {
  final BankEventType eventType;

  BankEvent({required this.eventType});
}

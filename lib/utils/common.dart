import 'package:newrelic_mobile/newrelic_mobile.dart';

recordCustomError(
  dynamic error,
  String errorCause, {
  StackTrace? stackTrace,
  List<String> additionalInfo = const [],
  bool isFatal = false,
}) {
  NewrelicMobile.instance.recordError(
    error,
    stackTrace,
    isFatal: isFatal,
    attributes: {
      'errorCause': errorCause,
      'additionalInfo': additionalInfo,
    },
  );
}

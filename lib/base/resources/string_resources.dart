import 'package:bank_base_sdk/resources/string/base_string_getters.dart';

class StringResources extends BaseStringResources {
  @override
  String get kUnderReview => "Your application is under review with X Bank";
  @override
  String get prelimCheckHeader =>
      '''Do you have an existing credit card or any unsecured personal loan with X Bank?''';
  @override
  String get kRejectionFailedDescription =>
      'As per bank\'s internal policies, unfortunately we can’t give you a Scapia X credit card today.\nTill then, we wish you the best of travels!';
  @override
  String get kReviewCreditLimitConsent =>
      "I hereby grant X bank to access my credit information report from bureau for the purpose of credit limit assessment";
}

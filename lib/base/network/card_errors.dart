class CardErrorTypes {
  static String error_10001 = '10001'; //null body
  static String error_10002 = '10002'; //empty body
  static String error_10003 = '10003'; //un-parseable response
  static String error_10004 = '10004'; //timeout
  static String error_10005 = '10005'; //no internet
  static String error_10007 = '10007'; //misc error
  static String error_10008 = '10008'; //parsing of kit number failed
  static String error_10009 = '10009'; // card home downtime error
  static String error_52505 = '52505'; // backend downtime error
  static String errorCardValidationFailure = 'card_validation_failure';
  static String errorEkycErrorNullOrEmpty = 'ekyc_url_null_empty';
  static String errorVkycErrorNullOrEmpty = 'vkyc_url_null_empty';
  static String errorVkycNetworkNotAvailable = 'vkyc_network_not_available';

  static String error_1005 = '1005';
  static String error_1013 = '1013'; //user locked by entering 3 wrong M-PINs
  static String mPinExpiredError = '1014';
  static String deviceUnauthenticatedError = '1016';
  static const String cardLockedCannotFetchCvv = '1018';
  static const String cardHotlistedError = '1020';
  static String error_2005 = '2005';
  static String error_5404 = '5404'; //selfie retake flow
  static String workFlowOutOfSync = '7000';
  static String ekycDocsExpired = '7001';
  static String panMismatchError = '8000';
  static String kitDobMismatchError = '1028';
  static String virtualCardBlocked = '1031';
  static String virtualCardBlockedRTO = '1032';
  static String cardRepalcementBlocked = '1036';
  static String blackListedCountryDetected = '2101';
  static String multipleLocationsDetected = '2102';
}

class CardNetworkErrorResponse {
  CardErrorDetail error;
  StackTrace? stackTrace;

  CardNetworkErrorResponse(this.error);

  CardNetworkErrorResponse.nullResponse()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10001, message: "Response body is null",);

  CardNetworkErrorResponse.emptyResponse()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10002,
            message: "Response body is empty",);

  CardNetworkErrorResponse.responseParsingFailed({String response = ""})
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10003, message: "Something went wrong!",);

  CardNetworkErrorResponse.timeout()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10004,
            message: "It's a missed connection",);

  CardNetworkErrorResponse.noInternet()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10005,
            message: "Are we still connected?",);

  CardNetworkErrorResponse.miscError()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10007, message: "Something went wrong!",);

  CardNetworkErrorResponse.userUnauthenticated()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_1005, message: "User unauthenticated",);

  CardNetworkErrorResponse.onboardingTokenExpired()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_2005,
            message: "Onboarding token expired",);

  CardNetworkErrorResponse.cardDetailsValidationFailed()
      : error = CardErrorDetail(
            code: CardErrorTypes.errorCardValidationFailure,
            message: "Incorrect card details",);

  CardNetworkErrorResponse.ekycNullOrEmptyResponse()
      : error = CardErrorDetail(
            code: CardErrorTypes.errorEkycErrorNullOrEmpty,
            message: "Error in connecting to Ekyc server",);

  CardNetworkErrorResponse.vkycNullOrEmptyResponse()
      : error = CardErrorDetail(
            code: CardErrorTypes.errorVkycErrorNullOrEmpty,
            message: "Error in connecting to video kyc server",);

  CardNetworkErrorResponse.networkNotAvailable()
      : error = CardErrorDetail(
            code: CardErrorTypes.errorVkycNetworkNotAvailable,
            message:
                "It seems like we lost you there. Are we still connected?",);

  CardNetworkErrorResponse.kitNoParsingFailed()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10008,
            message:
                "The scan could not complete successfully, Please try again",);

  CardNetworkErrorResponse.cardHomeDowntimeResponse()
      : error = CardErrorDetail(
            code: CardErrorTypes.error_10009,
            message:
                "Currently we are facing a downtime due to technical issues. We apologise for the inconvenience",);
  @override
  String toString() {
    return error.message;
  }

  CardNetworkErrorResponse.fromJson(Map<String, dynamic> json)
      : error = CardErrorDetail.fromJson(json['error']);

  Map<String, dynamic> toJson() => {'error': error.toJson()};
}

class CardErrorDetail {
  dynamic code;
  String message;

  CardErrorDetail({required this.code, required this.message});

  CardErrorDetail.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        message = json['message'];

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}

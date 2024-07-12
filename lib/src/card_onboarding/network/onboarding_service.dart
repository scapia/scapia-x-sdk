import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:scapia_x_sdk/base/network/base_services/scapia_x_onboarding_base_service.dart';

import 'onboarding_apis.dart';

enum OnboardingType {
  @JsonValue('CARD')
  card
}

class OnboardingService extends ScapiaXOnboardingBaseService {
  Future<CardOnboardingResponse> getCardOnboardingStatus({
    OnboardingType? onboardingType = OnboardingType.card,
  }) async {
    try {
      var response = await dio.get(
        OnboardingApis.onboardUserV2,
        queryParameters: {
          "onboardingType": onboardingType!.name.toUpperCase(),
        },
      );
      return CardOnboardingResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      return Future.error(getCardError(error, stackTrace));
    }
  }

  Future<CardOnboardingResponse> postCardOnboardingStatus(
    CardOnboardingRequest request,
  ) async {
    try {
      var response = await dio.post(
        OnboardingApis.onboardUserV2,
        data: request.toJson(),
      );
      return CardOnboardingResponse.fromJson(response.data);
    } catch (error, stackTrace) {
      return Future.error(getCardError(error, stackTrace));
    }
  }
}

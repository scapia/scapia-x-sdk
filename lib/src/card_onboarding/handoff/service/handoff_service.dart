import 'package:bank_base_sdk/card_onboarding/handoff/handoff_verification.dart';
import 'package:bank_base_sdk/utils/network/network_utils.dart';
import 'package:scapia_x_sdk/base/network/base_services/scapia_x_base_service.dart';
import 'package:scapia_x_sdk/src/card_onboarding/network/onboarding_apis.dart';

class HandoffService extends ScapiaXBaseService {
  Future<HandOffVerificationResponse> verifyHandoffSecret(
    HandOffVerificationRequest request,
  ) async {
    try {
      final res = await dio.post(
        OnboardingApis.validateHandoffToken,
        data: request,
      );
      return HandOffVerificationResponse.fromJson(res.data);
    } catch (error, stackTrace) {
      return Future.error(getCardError(error, stackTrace));
    }
  }
}

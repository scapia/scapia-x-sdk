import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:scapia_x_sdk/base/network/base_services/scapia_X_onboarding_base_service.dart';
import 'package:scapia_x_sdk/src/card_onboarding/network/onboarding_apis.dart';

class OnboardingPanInputService extends ScapiaXOnboardingBaseService {
  Future<VerifyPanResponseV2> verifyPanV2(VerifyPanRequestV2 request) async {
    try {
      final res = await dio.post(OnboardingApis.verifyPanV2, data: request);
      return VerifyPanResponseV2.fromJson(res.data);
    } catch (error, stackTrace) {
      getCardError(error, stackTrace);
      rethrow;
    }
  }
}

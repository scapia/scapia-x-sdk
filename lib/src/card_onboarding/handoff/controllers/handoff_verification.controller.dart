import 'package:bank_base_sdk/card_onboarding/handoff/handoff_verification.dart';
import 'package:scapia_x_sdk/src/card_onboarding/handoff/service/handoff_service.dart';
import 'package:scapia_x_sdk/utils/analytics/analytics_mixin.dart';
import 'package:scapia_x_sdk/utils/storage/storage_repo.dart';

class HandoffVerificationController extends HandoffVerificationInterface
    with AnalyticsMixin {
  HandoffVerificationController({
    required super.handOffVerificationRequest,
  }) {
    _handoffService = HandoffService();
    verifyHandoff();
  }

  late HandoffService _handoffService;

  @override
  Future<HandOffVerificationResponse> verifyHandoffSecret() async {
    try {
      var response =
          await _handoffService.verifyHandoffSecret(handOffVerificationRequest);
      await StorageRepo.updateOnboardingToken(response.accessToken);
      await StorageRepo.updateOnboardingRefreshToken(response.refreshToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

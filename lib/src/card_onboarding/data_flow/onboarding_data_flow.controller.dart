import 'package:bank_base_sdk/card_onboarding/data_flow/interfaces/onboarding_data_flow.interface.dart';
import 'package:bank_base_sdk/card_onboarding/models/onboarding_request_response.model.dart';
import 'package:bank_base_sdk/utils/enums/page_id.dart';
import 'package:bank_base_sdk/utils/mixins/utility_mixin.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:scapia_x_sdk/src/card_onboarding/network/onboarding_service.dart';
import 'package:scapia_x_sdk/utils/analytics/analytics_mixin.dart';
import 'package:scapia_x_sdk/utils/navigation/routes.dart';
import 'package:scapia_x_sdk/utils/storage/storage_repo.dart';

class OnboardingDataFlowController extends OnboardingDataFlowInterface
    with AnalyticsMixin, UtilityMixin {
  OnboardingDataFlowController() {
    _onboardingService = GetIt.instance.get<OnboardingService>();
  }

  late OnboardingService _onboardingService;

  @override
  Future<CardOnboardingResponse> getCardOnboardingStatus() async {
    return await _onboardingService.getCardOnboardingStatus();
  }

  @override
  void navigateToPage(CardOnboardingResponse response) {
    updateOnboardingPageId(response.pageId);
    switch (response.pageId) {
      case PageId.applicationEntry:
        Get.offAllNamed(
          Routes.applicationEntry,
          arguments: {
            "dob": response.customerDob ?? '',
            "nameOnPan": response.nameOnPan ?? '',
          },
        );
        break;
      case PageId.preliminaryEligibilityCheck:
        Get.offAllNamed(Routes.prelimCheck);
        break;
      case PageId.additionalPersonalInformation:
        showSnackBar(
          Get.context!,
          "Navigating to page ${response.pageId.name}",
        );
      default:
        // TODO navigate to default page
        break;
    }
  }

  @override
  Future<CardOnboardingResponse> postCardOnboardingStatus(
    CardOnboardingRequest request,
  ) async {
    return await _onboardingService.postCardOnboardingStatus(request);
  }

  Future<void> updateOnboardingPageId(PageId pageId) async {
    await StorageRepo.updateOnboardingPageId(pageId.name.toUpperCase());
  }
}

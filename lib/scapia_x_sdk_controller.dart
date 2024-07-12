import 'package:bank_base_sdk/base/bank_base_sdk_controller.dart';
import 'package:bank_base_sdk/base/resource_loader.dart';
import 'package:bank_base_sdk/card_onboarding/data_flow/bloc/onboarding_data_flow_bloc.dart';
import 'package:bank_base_sdk/card_onboarding/handoff/handoff_verification.dart';
import 'package:bank_base_sdk/utils/typedefs.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scapia_x_sdk/base/resources/string_resources.dart';
import 'package:scapia_x_sdk/src/card_onboarding/network/onboarding_service.dart';
import 'package:scapia_x_sdk/utils/storage/app_storage.dart';

import 'base/network/card_errors.dart';
import 'src/card_onboarding/data_flow/onboarding_data_flow.controller.dart';
import 'utils/navigation/routes.dart';

class ScapiaXSdkController extends BankBaseSdkController {
  ScapiaXSdkController._();

  static final ScapiaXSdkController _instance = ScapiaXSdkController._();

  static ScapiaXSdkController get instance => _instance;

  List<GetPage> get pages => Routes.pages;

  @override
  Future<void> init({
    required Json data,
    required BehaviorSubject<Json> eventStream,
  }) async {
    super.init(data: data, eventStream: eventStream);
    ResourceLoader.registerResources(resource: StringResources());
    await AppStorage.secureStorage().init();
    await AppStorage.storage().init();
  }

  @override
  void startOnboarding(Json handoffData) {
    try {
      GetIt.instance.registerSingleton(OnboardingService());
      GetIt.instance.registerSingleton(
        OnboardingDataFlowBloc(
          OnboardingDataFlowController(),
        ),
      );
      var handoffRequest = HandOffVerificationRequest.fromJson(handoffData);
      Get.toNamed(
        Routes.handoff,
        arguments: {
          'handoffRequest': handoffRequest,
        },
      );
    } catch (error) {
      throw CardNetworkErrorResponse.responseParsingFailed();
    }
  }
}

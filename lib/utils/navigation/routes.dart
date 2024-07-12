import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:bank_base_sdk/card_onboarding/stage1/stage1.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:scapia_x_sdk/src/card_onboarding/handoff/view/handoff_verification.view.dart';
import 'package:scapia_x_sdk/src/card_onboarding/prelim_check/view/onboarding_prelim_check.view.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/landing/views/stage1_landing.view.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_input/view/onboarding_pan_input.view.dart';
import 'package:scapia_x_sdk/src/card_onboarding/stage1/pan_verification/view/onboarding_pan_verification.view.dart';

class Routes {
  Routes._();

  static const _transition = Transition.rightToLeft;
  static const String handoff = '/handoff';
  static const String prelimCheck = '/prelimCheck';
  static const String applicationEntry = '/applicationEntry';
  static const String panInput = '/panInput';
  static const String panVerified = '/panVerified';

  static final pages = <GetPage>[
    GetPage(
      name: handoff,
      page: () {
        var handoffRequest = Get.arguments['handoffRequest'];
        if (handoffRequest is HandOffVerificationRequest) {
          return HandoffVerification(
            handOffVerificationRequest: handoffRequest,
          );
        }
        throw Exception("Invalid arguments");
      },
      transition: _transition,
    ),
    GetPage(
      name: prelimCheck,
      page: () => const OnboardingPrelimCheckView(),
      transition: _transition,
    ),
    GetPage(
      name: applicationEntry,
      page: () {
        var dob = Get.arguments['dob'];
        var nameOnPan = Get.arguments['nameOnPan'];
        if (dob is String && nameOnPan is String) {
          var stage1Bloc = GetIt.instance.registerSingleton(Stage1Bloc());
          stage1Bloc.add(
            Stage1DobUpdateEvent(dob: dob),
          );
          stage1Bloc.add(
            Stage1PanNameUpdateEvent(panName: nameOnPan),
          );
          return const Stage1LandingView();
        }
        throw Exception("Invalid arguments");
      },
      transition: _transition,
    ),
    GetPage(
      name: panInput,
      page: () {
        var nameOnPan = Get.arguments['nameOnPan'];
        if (nameOnPan is String) {
          return OnboardingPanInput(nameOnPan: nameOnPan);
        }
        throw Exception("Invalid arguments");
      },
      transition: _transition,
    ),
    GetPage(
      name: panVerified,
      page: () {
        var verifyPanResponse = Get.arguments['verifyPanResponse'];
        if (verifyPanResponse is VerifyPanResponseV2) {
          return OnboardingPanVerification(response: verifyPanResponse);
        }
        throw Exception("Invalid arguments");
      },
      transition: _transition,
    ),
  ];
}

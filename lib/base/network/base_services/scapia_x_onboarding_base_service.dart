import 'package:dio/dio.dart';
import 'package:scapia_x_sdk/utils/storage/storage_repo.dart';

import 'scapia_x_base_service.dart';

class ScapiaXOnboardingBaseService extends ScapiaXBaseService {
  @override
  BaseOptions get options {
    var options = super.options;
    options.headers["Authorization"] = "Bearer ${StorageRepo.onboardingToken}";
    return options;
  }
}

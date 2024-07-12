import 'app_storage.dart';
import 'storage_keys.dart';

class StorageRepo {
  static final AppStorage _secureStorage = AppStorage.secureStorage();
  static final AppStorage _storage = AppStorage.storage();

  static String get accessToken =>
      _secureStorage.readString(StorageKeys.accessToken) ?? '';

  static Future<void> updateAccessToken(String value) async {
    await _secureStorage.writeString(
      StorageKeys.accessToken,
      value,
    );
  }

  static String get onboardingToken =>
      _secureStorage.readString(StorageKeys.onboardingToken) ?? '';

  static Future<void> updateOnboardingToken(String value) async =>
      await _secureStorage.writeString(
        StorageKeys.onboardingToken,
        value,
      );

  static String get onboardingRefreshToken =>
      _secureStorage.readString(StorageKeys.onboardingRefreshToken) ?? '';

  static Future<void> updateOnboardingRefreshToken(String value) async =>
      await _secureStorage.writeString(
        StorageKeys.onboardingRefreshToken,
        value,
      );

  static String get onboardingPageId =>
      _secureStorage.readString(StorageKeys.onboardingPageId) ?? '';

  static Future<void> updateOnboardingPageId(String value) async =>
      await _secureStorage.writeString(
        StorageKeys.onboardingPageId,
        value,
      );
}

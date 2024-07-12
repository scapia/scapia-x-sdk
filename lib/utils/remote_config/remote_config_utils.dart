import 'dart:convert';

import 'package:scapia_x_sdk/utils/storage/app_storage.dart';

class RemoteConfigUtils {
  RemoteConfigUtils._();

  static void init({
    required Map<String, dynamic> remoteConfig,
  }) {
    for (MapEntry entry in remoteConfig.entries) {
      if (entry.value is String) {
        AppStorage.storage().writeString(entry.key, entry.value);
      } else if (entry.value is int) {
        AppStorage.storage().writeInt(entry.key, entry.value);
      } else if (entry.value is bool) {
        AppStorage.storage().writeBool(entry.key, entry.value);
      } else if (entry.value is Map) {
        AppStorage.storage().writeString(entry.key, jsonEncode(entry.value));
      }
    }
  }
}

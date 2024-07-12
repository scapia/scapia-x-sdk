import 'dart:async';
import 'package:bank_base_sdk/bank_base_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:shared_preferences_plus/shared_preferences_plus.dart';

abstract class AppStorage {
  static AppSharedPreferencesPlus? _securedInstance;
  static final Map<String, AppGetSecureStorage?> _getSecuredInstanceMap = {};

  factory AppStorage.storage([String? id]) {
    final containerId = id ?? kDefaultStorageContainerId;

    if (_getSecuredInstanceMap.containsKey(containerId) &&
        _getSecuredInstanceMap[containerId] != null) {
      return _getSecuredInstanceMap[containerId]!;
    }

    _getSecuredInstanceMap[containerId] = AppGetSecureStorage(
      GetSecureStorage(
        container: containerId,
        password: dotenv.env['GET_SECURE_STORAGE_PASSWORD'],
      ),
    );
    return _getSecuredInstanceMap[containerId]!;
  }

  factory AppStorage.secureStorage() {
    _securedInstance ??= AppSharedPreferencesPlus.instance;
    return _securedInstance!;
  }

  Future<void> init();

  String? readString(String key);

  Future<void> writeString(String key, String? value);

  int? readInt(String key);

  Future<void> writeInt(String key, int? value);

  bool? readBool(String key);

  Future<void> writeBool(String key, bool? value);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Iterable<String> getKeys();
}

class AppGetSecureStorage implements AppStorage {
  final GetSecureStorage _getSecureStorage;

  AppGetSecureStorage(this._getSecureStorage);

  @override
  Future<void> init() async {
    await _getSecureStorage.initStorage;
  }

  dynamic _read(String key) {
    return _getSecureStorage.read(key);
  }

  Future<void> _write(String key, dynamic value) {
    return _getSecureStorage.write(key, value);
  }

  @override
  Future<void> delete(String key) {
    return _getSecureStorage.remove(key);
  }

  @override
  Future<void> deleteAll() {
    return _getSecureStorage.erase();
  }

  @override
  Iterable<String> getKeys() {
    var keys = _getSecureStorage.getKeys();
    return keys;
  }

  @override
  String? readString(String key) {
    return _read(key);
  }

  @override
  Future<void> writeString(String key, String? value) {
    return _write(key, value);
  }

  @override
  int? readInt(String key) {
    return _read(key);
  }

  @override
  Future<void> writeInt(String key, int? value) {
    return _write(key, value);
  }

  @override
  bool? readBool(String key) {
    return _read(key);
  }

  @override
  Future<void> writeBool(String key, bool? value) {
    return _write(key, value);
  }

  void listenKey(String key, void Function(dynamic) callback) {
    _getSecureStorage.listenKey(key, callback);
  }
}

class AppSharedPreferencesPlus implements AppStorage {
  final SharedPreferencesPlus _sharedPreferencesPlus;

  AppSharedPreferencesPlus._(this._sharedPreferencesPlus);

  static AppSharedPreferencesPlus? _instance;

  static AppSharedPreferencesPlus get instance =>
      _instance ??= AppSharedPreferencesPlus._(
        SharedPreferencesPlus(),
      );

  @override
  Future<void> init() async {
    await _sharedPreferencesPlus.init(
      password: dotenv.env['GET_SECURE_STORAGE_PASSWORD'],
    );
  }

  @override
  Future<void> delete(String key) {
    return _sharedPreferencesPlus.delete(key);
  }

  @override
  Future<void> deleteAll() {
    return _sharedPreferencesPlus.deleteAll();
  }

  @override
  Iterable<String> getKeys() {
    return _sharedPreferencesPlus.getKeys();
  }

  @override
  String? readString(String key) {
    return _sharedPreferencesPlus.readString(key);
  }

  @override
  Future<void> writeString(String key, String? value) {
    try {
      return _sharedPreferencesPlus.writeString(key, value);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }

  @override
  int? readInt(String key) {
    return _sharedPreferencesPlus.readInt(key);
  }

  @override
  Future<void> writeInt(String key, int? value) {
    try {
      return _sharedPreferencesPlus.writeInt(key, value);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }

  @override
  bool? readBool(String key) {
    return _sharedPreferencesPlus.readBool(key);
  }

  @override
  Future<void> writeBool(String key, bool? value) {
    try {
      return _sharedPreferencesPlus.writeBool(key, value);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }
}

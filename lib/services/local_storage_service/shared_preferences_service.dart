// ignore_for_file: always_use_package_imports, unnecessary_await_in_return, type_annotate_public_apis, always_declare_return_types, lines_longer_than_80_chars

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/app_config.dart';
import '../../injector/injector.dart';
import 'local_storage_service.dart';

class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService() {
    init();
  }
  late final SharedPreferences _pref;

  @override
  String tokenKey = 'tokenKey';
  @override
  String localeKey = 'localeKey';
  @override
  String isDarkModeKey = 'isDarkModeKey';
  @override
  String isFirstUseKey = 'isFirstUseKey';

  @override
  FutureOr<void> init() async {
    _pref = await SharedPreferences.getInstance();
    Injector.instance.signalReady(this);
  }

  @override
  String? get token => _pref.getString(tokenKey);

  @override
  bool get isDarkMode => _pref.getBool(isDarkModeKey) ?? false;

  @override
  bool get isFirstUse => _pref.getBool(isFirstUseKey) ?? false;

  @override
  String get locale => _pref.getString(localeKey) ?? AppConfig.defaultLocale;

  @override
  Future<bool> setIsDarkMode(bool isDarkMode) async {
    return await _pref.setBool(isDarkModeKey, isDarkMode);
  }

  @override
  Future<bool> setIsFirstUse(bool isFirstUse) async {
    return await _pref.setBool(isFirstUseKey, isFirstUse);
  }

  @override
  Future<bool> setLocale(String locale) async {
    return await _pref.setString(localeKey, locale);
  }

  @override
  Future<bool> setToken(String token) async {
    return await _pref.setString(tokenKey, token);
  }

  @override
  getValue({required String key}) {
    return _pref.get(key);
  }

  @override
  void setValue({required String key, required value}) {}
}

// ignore_for_file: flutter_style_todos, always_use_package_imports, type_annotate_public_apis, always_declare_return_types, lines_longer_than_80_chars

import 'dart:async';

import 'shared_preferences_service.dart';

// ignore: todo
/// TODO: modify this if you use Hive packages
class HiveService implements SharedPreferencesService {
  @override
  String isDarkModeKey = 'hiveIsDarkModeKey';

  @override
  String isFirstUseKey = 'hiveIsFirstUseKey';

  @override
  String localeKey = 'hiveLocaleKey';

  @override
  String tokenKey = 'hiveTokenKey';

  @override
  getValue({required String key}) {
    // ignore: todo
    // TODO: implement getValue
    throw UnimplementedError();
  }

  @override
  FutureOr<void> init() {
    // ignore: todo
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  // ignore: todo
  // TODO: implement isDarkMode
  bool get isDarkMode => throw UnimplementedError();

  @override
  // ignore: todo
  // TODO: implement isFirstUse
  bool get isFirstUse => throw UnimplementedError();

  @override
  // ignore: todo
  // TODO: implement locale
  String get locale => throw UnimplementedError();

  @override
  Future<bool> setIsDarkMode(bool isDarkMode) {
    // ignore: todo
    // TODO: implement setIsDarkMode
    throw UnimplementedError();
  }

  @override
  Future<bool> setIsFirstUse(bool isFirstUse) {
    // ignore: todo
    // TODO: implement setIsFirstUse
    throw UnimplementedError();
  }

  @override
  Future<bool> setLocale(String locale) {
    // ignore: todo
    // TODO: implement setLocale
    throw UnimplementedError();
  }

  @override
  Future<bool> setToken(String token) {
    // ignore: todo
    // TODO: implement setToken
    throw UnimplementedError();
  }

  @override
  void setValue({required String key, required value}) {
    // ignore: todo
    // TODO: implement setValue
  }

  @override
  // ignore: todo
  // TODO: implement token
  String? get token => throw UnimplementedError();
}

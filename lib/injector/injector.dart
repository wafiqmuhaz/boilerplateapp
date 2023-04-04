// ignore_for_file: always_use_package_imports

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'bloc_module.dart';
import 'database_module.dart';
import 'repository_module.dart';
import 'rest_client_module.dart';
import 'service_module.dart';

class Injector {
  Injector._();
  static GetIt instance = GetIt.instance;

  static void init() {
    ServiceModule.init();
    RestClientModule.init();

    if (!kIsWeb) {
      DatabaseModule.init();
      DatabaseModule.initRepositories();
    }

    RepositoryModule.init();
    BlocModule.init();
  }

  static void reset() {
    instance.reset();
  }

  static void resetLazySingleton() {
    instance.resetLazySingleton();
  }
}

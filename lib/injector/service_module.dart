// ignore_for_file: unnecessary_lambdas, cascade_invocations, always_use_package_imports, lines_longer_than_80_chars

import '../services/crashlytics_service/crashlytics_service.dart';
import '../services/crashlytics_service/firebase_crashlytics_service.dart';
import '../services/local_storage_service/local_storage_service.dart';
import '../services/local_storage_service/shared_preferences_service.dart';
import '../services/log_service/debug_log_service.dart';
import '../services/log_service/log_service.dart';
import 'injector.dart';

class ServiceModule {
  ServiceModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerSingletonAsync<CrashlyticsService>(
      () async {
        return FirebaseCrashlyticsService();
      },
    );

    injector.registerFactory<LogService>(
      () => DebugLogService(),
    );

    injector.registerSingleton<LocalStorageService>(
      SharedPreferencesService(),
      signalsReady: true,
    );
  }
}

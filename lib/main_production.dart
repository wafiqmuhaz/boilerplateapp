// ignore_for_file: unawaited_futures, omit_local_variable_types, cascade_invocations, always_use_package_imports, lines_longer_than_80_chars

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive/hive.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';
import 'configs/app_config.dart';
import 'injector/injector.dart';
import 'services/crashlytics_service/crashlytics_service.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Hydrat Storage
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }
    final Directory tmpDir = await getTemporaryDirectory();
    Hive.init(tmpDir.toString());
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: tmpDir,
    );

    /// Firebase initialize ...
    Logger.level = Level.verbose;
    AppConfig.configDev();
    Injector.init();

    await Injector.instance.allReady();

    bootstrap(() => const App());
  }, (error, stack) {
    final CrashlyticsService crashlyticsService =
        Injector.instance<CrashlyticsService>();
    crashlyticsService.recordException(error, stack);
  });
}

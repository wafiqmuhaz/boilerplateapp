// ignore_for_file: always_use_package_imports, omit_local_variable_types, cascade_invocations, lines_longer_than_80_chars

import 'package:local_database/local_database.dart';

import '../data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import '../data/repositories/dog_image_random/local/dog_image_local_repository_impl.dart';
import 'injector.dart';

class DatabaseModule {
  DatabaseModule._();

  static void init() {
    final injector = Injector.instance;

    /* Floor package didn't support for Web platform
    If you run this repo on web, you must remove Local database module, or using
    another local database package, or check kIsWeb everywhere you use the local
    database module
    */

    injector.registerSingletonAsync<AppDatabaseManager>(() async {
      final AppDatabaseManager databaseManager = AppDatabaseManager();
      await databaseManager.createDatabase();
      return databaseManager;
    });
  }

  static void initRepositories() {
    final injector = Injector.instance;
    injector.registerFactory<DogImageLocalRepository>(
      () => DogImageLocalRepositoryImpl(
        appDatabaseManager: injector(),
      ),
    );
  }
}

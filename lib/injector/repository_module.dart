// ignore_for_file: always_use_package_imports

import '../data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import '../data/repositories/dog_image_random/remote/dog_image_random_repository_impl.dart';
import 'injector.dart';

class RepositoryModule {
  RepositoryModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<DogImageRandomRepository>(
      () => DogImageRandomRepositoryImpl(
        dogApiClient: injector(),
      ),
    );
  }
}

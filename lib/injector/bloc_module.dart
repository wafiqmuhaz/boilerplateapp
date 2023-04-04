// ignore_for_file: always_use_package_imports

import '../features/application/bloc/application_bloc.dart';
import '../features/demo/bloc/demo_bloc.dart';
import '../features/dog_image_random/bloc/dog_image_random_bloc.dart';
import 'injector.dart';

class BlocModule {
  BlocModule._();

  static void init() {
    final injector = Injector.instance;

    injector..registerSingleton<ApplicationBloc>(
        ApplicationBloc(localStorageService: injector(),),)

    ..registerFactory<DogImageRandomBloc>(
      () => DogImageRandomBloc(
        dogImageRandomRepository: injector(),
        logService: injector(),
      ),
    )

    ..registerFactory<DemoBloc>(
      () => DemoBloc(
        dogImageRandomRepository: injector(),
        logService: injector(),
      ),
    );
  }
}

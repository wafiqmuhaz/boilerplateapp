// ignore_for_file: always_use_package_imports, omit_local_variable_types, flutter_style_todos, lines_longer_than_80_chars, avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:rest_client/rest_client.dart';

import '../configs/app_config.dart';
import 'injector.dart';

class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;
    const String dioInstance = 'dioInstance';

    /// Dio
    injector
      ..registerLazySingleton<Dio>(
        () {
          // ignore: todo
          /// TODO: custom DIO here
          final Dio dio = Dio(
            BaseOptions(
              baseUrl: AppConfig.baseUrl,
            ),
          );
          if (!kReleaseMode) {
            dio.interceptors.add(
              LogInterceptor(
                requestHeader: true,
                requestBody: true,
                responseHeader: true,
                responseBody: true,
                request: false,
              ),
            );
          }
          return dio;
        },
        instanceName: dioInstance,
      )
      ..registerFactory<DogApiClient>(
        () => DogApiClient(
          injector(instanceName: dioInstance),
        ),
      );
  }
}

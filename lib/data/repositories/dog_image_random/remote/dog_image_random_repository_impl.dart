// ignore_for_file: always_use_package_imports, unnecessary_await_in_return, invalid_return_type_for_catch_error, lines_longer_than_80_chars

import 'package:rest_client/rest_client.dart';
import 'dog_image_random_repository.dart';

class DogImageRandomRepositoryImpl implements DogImageRandomRepository {
  DogImageRandomRepositoryImpl({
    required DogApiClient dogApiClient,
  }) : _dogApiClient = dogApiClient;

  late final DogApiClient _dogApiClient;

  /// Remote
  @override
  Future<DogImage> getDogImageRandom() async {
    return await _dogApiClient
        .getDogImageRandom()
        .catchError(ExceptionHandler.handleException);
  }
}

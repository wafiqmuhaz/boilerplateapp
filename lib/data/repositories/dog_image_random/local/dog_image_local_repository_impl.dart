// ignore_for_file: always_use_package_imports, omit_local_variable_types, unnecessary_await_in_return, lines_longer_than_80_chars

import 'package:local_database/local_database.dart';
import 'dog_image_local_repository.dart';

class DogImageLocalRepositoryImpl implements DogImageLocalRepository {
  DogImageLocalRepositoryImpl({
    required AppDatabaseManager appDatabaseManager,
  }) : _appDatabaseManager = appDatabaseManager;

  late final AppDatabaseManager _appDatabaseManager;

  /// Local
  @override
  Future<void> insertDogImageDB(DogImageEntity dogImageEntity) async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    await dao.insertDogImage(dogImageEntity);
  }

  @override
  Future<List<DogImageEntity>> getDogImagesFromDB() async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    return await dao.findAllDogImages();
  }

  @override
  Future<DogImageEntity?> deleteDogImageDB(String message) async {
    final DogImageDao dao = await _appDatabaseManager.dogImageDao;
    return await dao.deleteDogImage(message);
  }
}

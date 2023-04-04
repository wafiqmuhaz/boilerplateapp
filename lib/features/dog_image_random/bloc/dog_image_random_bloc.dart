// ignore_for_file: always_use_package_imports, omit_local_variable_types

import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

import '../../../data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import '../../../data/repositories/dog_image_random/remote/dog_image_random_repository.dart';
import '../../../services/log_service/log_service.dart';
import '../../../utils/mapper_utils.dart';
import '../../application/bloc/application_bloc.dart';

part 'dog_image_random_event.dart';
part 'dog_image_random_state.dart';
part 'dog_image_random_bloc.freezed.dart';

class DogImageRandomBloc
    extends Bloc<DogImageRandomEvent, DogImageRandomState> {
  DogImageRandomBloc({
    required DogImageRandomRepository dogImageRandomRepository,
    required LogService logService,
    DogImageLocalRepository? dogImageLocalRepository,
  }) : super(
          const DogImageRandomState(
            dogImage: DogImage(message: '', status: ''),
          ),
        ) {
    _repository = dogImageRandomRepository;
    _localRepository = dogImageLocalRepository;
    _log = logService;
    on<DogImageRandomLoaded>(_onLoaded);
    on<DogImageRandomRandomRequested>(
      _onRandom,
      transformer: droppable(),
    );
  }

  late final DogImageRandomRepository _repository;
  late final DogImageLocalRepository? _localRepository;
  late final LogService _log;

  FutureOr<void> _onLoaded(
    DogImageRandomLoaded event,
    Emitter<DogImageRandomState> emit,
  ) {
    try {} catch (e, s) {
      _log.e('DogImageRandomLoaded failed', e, s);
      emit(
        state.copyWith(
          status: UIStatus.loadFailed,
          errorMsg: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onRandom(
    DogImageRandomRandomRequested event,
    Emitter<DogImageRandomState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: UIStatus.loading,
        ),
      );

      final DogImage image = await _repository.getDogImageRandom();

      if (event.insertDb && !kIsWeb && _localRepository != null) {
        final DogImageEntity entity = MapperUtils.mapDogImage(image);
        await _localRepository!.insertDogImageDB(entity);
      }

      emit(
        state.copyWith(
          status: UIStatus.loadSuccess,
          dogImage: image,
        ),
      );
    } catch (e, s) {
      _log.e('DogImageRandomLoaded failed', e, s);
      emit(
        state.copyWith(
          notification: _NotificationNotifyFailed(
            message: e.toString(),
          ),
        ),
      );
    }
  }
}

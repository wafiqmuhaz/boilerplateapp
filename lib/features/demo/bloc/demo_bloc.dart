// ignore_for_file: always_use_package_imports, omit_local_variable_types, unnecessary_lambdas, lines_longer_than_80_chars, cascade_invocations

import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_database/local_database.dart';
import 'package:rest_client/rest_client.dart';

import '../../../data/repositories/dog_image_random/local/dog_image_local_repository.dart';
import '../../../services/log_service/log_service.dart';
import '../../../utils/mapper_utils.dart';
import '../../application/bloc/application_bloc.dart';

part 'demo_event.dart';
part 'demo_state.dart';
part 'demo_bloc.freezed.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  DemoBloc({
    required LogService logService,
    required DogImageLocalRepository dogImageRandomRepository,
  }) : super(const DemoState()) {
    _repository = dogImageRandomRepository;
    _logService = logService;
    on<DemoLoadImageFromDB>(_onImagesLoadFromDB);
    on<DemoDeleteImageFromDB>(_onDeleteImageFromDB);
  }

  late final DogImageLocalRepository _repository;
  late final LogService _logService;

  FutureOr<void> _onImagesLoadFromDB(
    DemoLoadImageFromDB event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: UIStatus.loading,
        ),
      );

      final List<DogImageEntity> imageEntities =
          await _repository.getDogImagesFromDB();

      final List<DogImage> images =
          imageEntities.map((e) => MapperUtils.mapDogImageEntity(e)).toList();

      emit(
        state.copyWith(
          status: UIStatus.loadSuccess,
          images: images,
        ),
      );
    } catch (e, s) {
      _logService.e('DemoLoadImageFromDB failed', e, s);
      emit(
        state.copyWith(
          status: UIStatus.loadFailed,
          errorMsg: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onDeleteImageFromDB(
    DemoDeleteImageFromDB event,
    Emitter<DemoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isBusy: true,
        ),
      );

      await _repository.deleteDogImageDB(event.message);

      final List<DogImage> images = List.from(state.images);

      images.removeWhere((element) => element.message == event.message);

      emit(
        state.copyWith(
          notification: _NotificationInsertSuccess(message: 'Delete Succes'),
          images: images,
          isBusy: false,
        ),
      );
    } catch (e, s) {
      _logService.e('DemoLoadImageFromDB failed', e, s);
      emit(
        state.copyWith(
          notification: _NotificationInsertFailed(message: e.toString()),
          isBusy: false,
        ),
      );
    }
  }
}

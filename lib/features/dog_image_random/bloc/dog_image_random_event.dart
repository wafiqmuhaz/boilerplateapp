part of 'dog_image_random_bloc.dart';

@Freezed()
class DogImageRandomEvent with _$DogImageRandomEvent {
  const factory DogImageRandomEvent.loaded() = DogImageRandomLoaded;
  const factory DogImageRandomEvent.randomRequested({
    @Default(false) bool insertDb,
  }) = DogImageRandomRandomRequested;
}

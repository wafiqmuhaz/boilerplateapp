// ignore_for_file: one_member_abstracts

import 'package:rest_client/rest_client.dart';

abstract class DogImageRandomRepository {
  /// Remote
  Future<DogImage> getDogImageRandom();
}

class CustomException implements Exception {
  CustomException();

  // ignore: todo
  /// TODO: implement your exception from json
  CustomException.fromJson(Map<String, dynamic> json);
  // ignore: todo
  /// TODO: implement your message
  @override
  String toString() {
    return 'CustomException';
  }
}

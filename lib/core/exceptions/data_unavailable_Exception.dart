class DataUnavailableException implements Exception {
  final String message;

  DataUnavailableException({required this.message});

  @override
  String toString() {
    return message;
  }
}

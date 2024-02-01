class UnKnownException implements Exception {
  final String message;

  UnKnownException({this.message = 'Unknown Exception.'});

  @override
  String toString() {
    return 'Unknown Exception: $message';
  }
}

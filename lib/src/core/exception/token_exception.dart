class TokenException implements Exception {
  TokenException(this.message, this.source);

  final String message;
  final String? source;

  @override
  String toString() {
    if (source != null) {
      String report = message;
      return report;
    } else {
      return message;
    }
  }
}

class DeckException implements Exception {
  DeckException(this.message);
  final dynamic message;

  @override
  String toString() {
    Object? message = this.message;
    if (message == null) return "DeckException";
    return "DeckException: $message";
  }
}
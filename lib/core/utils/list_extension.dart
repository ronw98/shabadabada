extension ListExt<V> on List<V> {
  List<V?> expandToLength(int newLength) {
    if (newLength <= length) return this;
    return cast<V?>().toList()
      ..addAll(
        List.filled(newLength - length, null),
      );
  }
}

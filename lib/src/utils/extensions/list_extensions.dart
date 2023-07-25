extension ImmutableList on List<dynamic> {
  List<T> toUnmodifiableList<T>() {
    final data = map((e) => e as T);

    return List<T>.unmodifiable(data);
  }
}

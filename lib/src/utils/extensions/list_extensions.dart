// Create an extension on the List<dynamic> class to add a toUnmodifiableList() method.
extension ImmutableList on List<dynamic> {
  /// Convert a List<dynamic> to an unmodifiable List<T>.
  ///
  /// This extension method allows converting a List of dynamic elements
  /// to an unmodifiable List of type T. The type parameter 'T' should be
  /// specified when calling this method, and it represents the desired type
  /// for the elements in the resulting List.
  ///
  /// Returns:
  ///   An unmodifiable List<T> containing the elements converted to the specified type.
  ///
  /// Example:
  /// ```dart
  /// List<dynamic> dynamicList = [1, 2, 3];
  /// List<int> unmodifiableIntList = dynamicList.toUnmodifiableList<int>();
  /// ```
  List<T> toUnmodifiableList<T>() {
    // Use the 'map' method to convert each element 'e' in the List to type 'T'.
    // The 'e as T' syntax is used to cast each element to the desired type 'T'.
    final data = map((e) => e as T);

    // Use the 'List<T>.unmodifiable' constructor to create an unmodifiable List<T>.
    // 'List<T>.unmodifiable' takes an Iterable<T> as input and returns an unmodifiable List<T>.
    return List<T>.unmodifiable(data);
  }
}

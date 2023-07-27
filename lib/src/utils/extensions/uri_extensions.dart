// Create an extension on the Uri class to add a copyWith() method.
extension UriCopyWith on Uri {
  /// Create a new Uri by copying the original Uri and applying specified changes.
  ///
  /// This extension method allows creating a new Uri based on the original Uri
  /// with optional modifications. You can provide new values for the 'scheme',
  /// 'host', 'path', and 'queryParameters' of the Uri. If a parameter is not
  /// specified (i.e., null), the value from the original Uri is used.
  ///
  /// Parameters:
  ///   scheme (optional): The new scheme to use. If null, the original Uri's scheme is used.
  ///   host (optional): The new host to use. If null, the original Uri's host is used.
  ///   path (optional): The new path to use. If null, the original Uri's path is used.
  ///   queryParameters (optional): The new query parameters to use. If null, the original
  ///                               Uri's query parameters are used.
  ///
  /// Returns:
  ///   A new Uri instance with the specified changes, based on the original Uri.
  ///
  /// Example:
  /// ```dart
  /// Uri originalUri = Uri.parse('https://example.com/api?limit=10&page=1');
  /// Uri modifiedUri = originalUri.copyWith(queryParameters: {'page': '2'});
  /// ```
  Uri copyWith({
    String? scheme,
    String? host,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) {
    // Use the Uri constructor to create a new Uri instance with optional modifications.
    // If a parameter is not specified (i.e., null), use the value from the original Uri.
    return Uri(
      scheme: scheme ?? this.scheme,
      host: host ?? this.host,
      path: path ?? this.path,
      queryParameters: queryParameters ?? this.queryParameters,
    );
  }
}

extension UriCopyWith on Uri {
  Uri copyWith({
    String? scheme,
    String? host,
    String? path,
    Map<String, dynamic>? queryParameters,
  }) {
    return Uri(
      scheme: scheme ?? this.scheme,
      host: host ?? this.host,
      path: path ?? this.path,
      queryParameters: queryParameters ?? this.queryParameters,
    );
  }
}

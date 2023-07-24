import 'dart:convert';

import 'package:http/http.dart' as http;

base class Repository {
  Repository({
    required http.Client client,
  }) : _client = client;

  final Uri baseUri = Uri(
    scheme: 'https',
    host: 'dev2be.oruphones.com',
    path: 'api/v1/global/assignment',
  );

  final http.Client _client;

  http.Client get client => _client;
}

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

extension HttpBodyToJson on http.Response {
  Map<String, dynamic> toJson<T>() {
    return jsonDecode(body);
  }
}

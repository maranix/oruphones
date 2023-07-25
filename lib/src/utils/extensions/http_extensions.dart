import 'dart:convert';

import 'package:http/http.dart' as http;

extension HttpBodyToJson on http.Response {
  Map<String, dynamic> toJson<T>() {
    return jsonDecode(body);
  }
}

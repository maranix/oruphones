import 'dart:convert';

import 'package:http/http.dart' as http;

// Create an extension on the http.Response class to add a toJson() method.
extension HttpBodyToJson on http.Response {
  /// Convert the response body from JSON to a Dart Map.
  ///
  /// This extension method can be used to conveniently convert the JSON
  /// response body to a Dart Map. The 'T' type parameter is not used in
  /// this implementation but can be useful when you have more complex
  /// JSON data structures that require type casting.
  ///
  /// Returns:
  ///   A Map<String, dynamic> containing the JSON data from the response body.
  Map<String, dynamic> toJson<T>() {
    // Use the jsonDecode function from 'dart:convert' to convert the JSON
    // data in the response body to a Map<String, dynamic>.
    return jsonDecode(body);
  }
}

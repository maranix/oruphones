import 'package:equatable/equatable.dart';
import 'package:oruphones/src/utils/utils.dart';

// Define a class 'Search' that extends 'Equatable'.
// This class represents search results with a list of makes and models.
final class Search extends Equatable {
  const Search({
    required this.makes,
    required this.models,
    required this.message,
  });

  // The list of available makes in the search results.
  final List<String> makes;

  // The list of available models in the search results.
  final List<String> models;

  // A message associated with the search results.
  final String message;

  // Create an instance of 'Search' from a JSON map.
  //
  // This factory constructor is used to deserialize a JSON map into a 'Search' object.
  // The provided JSON map should contain keys corresponding to each property of the 'Search' class,
  // and the corresponding values should be lists of strings for 'makes' and 'models' properties
  // and a string for the 'message' property.
  //
  // Parameters:
  //   json: A Map<String, dynamic> containing the search response data in JSON format.
  //
  // Returns:
  //   A 'Search' object containing the deserialized search response data.
  //
  // Throws:
  //   FormatException: When the JSON map is not in the expected format.
  factory Search.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'makes': List<dynamic> makes,
          'models': List<dynamic> models,
          'message': String message,
        }) {
      return Search(
        makes: makes.toUnmodifiableList<String>(),
        models: models.toUnmodifiableList<String>(),
        message: message,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Search response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        makes,
        models,
        message,
      ];
}

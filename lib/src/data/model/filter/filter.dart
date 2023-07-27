import 'package:equatable/equatable.dart';
import 'package:oruphones/src/utils/utils.dart';

// Define a class 'Filters' that extends 'Equatable'.
// This class represents a set of filters used in a search feature.
final class Filters extends Equatable {
  const Filters({
    required this.make,
    required this.condition,
    required this.storage,
    required this.ram,
  });

  // A list of selected makes for filtering search results.
  final List<String> make;

  // A list of selected conditions for filtering search results.
  final List<String> condition;

  // A list of selected storage options for filtering search results.
  final List<String> storage;

  // A list of selected RAM options for filtering search results.
  final List<String> ram;

  // Create an instance of 'Filters' from a JSON map.
  //
  // This factory constructor is used to deserialize a JSON map into a 'Filters' object.
  // The provided JSON map should have the keys 'make', 'condition', 'storage', and 'ram',
  // with each corresponding value being a List<dynamic>.
  // The factory method converts these dynamic lists into unmodifiable lists of type String.
  //
  // Parameters:
  //   json: A Map<String, dynamic> containing the filter data in JSON format.
  //
  // Returns:
  //   A 'Filters' object containing the deserialized filter data.
  //
  // Throws:
  //   FormatException: When the JSON map is not in the expected format.
  factory Filters.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'filters': {
            'make': List<dynamic> make,
            'condition': List<dynamic> condition,
            'storage': List<dynamic> storage,
            'ram': List<dynamic> ram,
          }
        }) {
      return Filters(
        make: make.toUnmodifiableList<String>(),
        condition: condition.toUnmodifiableList<String>(),
        storage: storage.toUnmodifiableList<String>(),
        ram: ram.toUnmodifiableList<String>(),
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Filter response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        make,
        condition,
        storage,
        ram,
      ];
}

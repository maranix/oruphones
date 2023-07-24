import 'package:equatable/equatable.dart';
import 'package:oruphones/data/model/helper.dart';

final class Filters extends Equatable {
  const Filters({
    required this.make,
    required this.condition,
    required this.storage,
    required this.ram,
  });

  final List<String> make;
  final List<String> condition;
  final List<String> storage;
  final List<String> ram;

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

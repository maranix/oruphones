import 'package:equatable/equatable.dart';
import 'package:oruphones/data/model/helper.dart';

final class Search extends Equatable {
  const Search({
    required this.makes,
    required this.models,
    required this.message,
  });

  final List<String> makes;
  final List<String> models;
  final String message;

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

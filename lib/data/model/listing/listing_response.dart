import 'package:equatable/equatable.dart';

import 'listing.dart';

final class ListingResponse extends Equatable {
  const ListingResponse({
    required this.listings,
    required this.nextPage,
    required this.message,
  });

  final List<Listing> listings;
  final int nextPage;
  final String message;

  factory ListingResponse.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'listings': List<dynamic> listingsResponse,
          'nextPage': String nextPage,
          'message': String message,
        }) {
      final listings = List<Listing>.unmodifiable(
        listingsResponse.map(
          (e) => Listing.fromJson(e as Map<String, dynamic>),
        ),
      );

      return ListingResponse(
        listings: listings,
        nextPage: int.parse(nextPage),
        message: message,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Listing response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        listings,
        nextPage,
        message,
      ];
}

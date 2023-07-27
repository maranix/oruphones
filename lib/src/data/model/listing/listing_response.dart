import 'package:equatable/equatable.dart';

import 'listing.dart';

// Define a class 'ListingResponse' that extends 'Equatable'.
// This class represents a response containing a list of 'Listing' items.
final class ListingResponse extends Equatable {
  const ListingResponse({
    required this.listings,
    required this.nextPage,
    required this.message,
  });

  // The list of 'Listing' items in the response.
  final List<Listing> listings;

  // The page number for the next set of listings (if available).
  final int nextPage;

  // A message associated with the response.
  final String message;
  // Create an instance of 'ListingResponse' from a JSON map.
  //
  // This factory constructor is used to deserialize a JSON map into a 'ListingResponse' object.
  // The provided JSON map should contain keys corresponding to each property of the 'ListingResponse' class,
  // and the corresponding values should match the type of each property.
  //
  // Parameters:
  //   json: A Map<String, dynamic> containing the listing response data in JSON format.
  //
  // Returns:
  //   A 'ListingResponse' object containing the deserialized listing response data.
  //
  // Throws:
  //   FormatException: When the JSON map is not in the expected format.
  factory ListingResponse.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'listings': List<dynamic> listingsResponse,
          'nextPage': String nextPage,
          'message': String message,
        }) {
      // Convert the list of 'Listings' from the JSON map into an unmodifiable list.
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

  // Create a new instance of 'ListingResponse' with optional modifications.
  //
  // This method is used to create a new instance of 'ListingResponse' based on the current instance,
  // with optional modifications to the 'listings', 'nextPage', and 'message' properties.
  //
  // Parameters:
  //   listings (optional): The new list of 'Listing' items. If not provided, the current list is used.
  //   nextPage (optional): The new page number for the next set of listings. If not provided, the current page number is used.
  //   message (optional): The new message associated with the response. If not provided, the current message is used.
  //
  // Returns:
  //   A new instance of 'ListingResponse' with the specified modifications.
  ListingResponse copyWith({
    List<Listing>? listings,
    int? nextPage,
    String? message,
  }) {
    return ListingResponse(
      listings: listings ?? this.listings,
      nextPage: nextPage ?? this.nextPage,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        listings,
        nextPage,
        message,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

// Define a class 'Listing' that extends 'Equatable'.
// This class represents a listing item with various properties.
final class Listing extends Equatable {
  const Listing({
    required this.id,
    required this.deviceCondition,
    required this.listedBy,
    required this.deviceStorage,
    required this.images,
    required this.defaultImage,
    required this.listingLocation,
    required this.make,
    required this.marketingName,
    required this.mobileNumber,
    required this.model,
    required this.verified,
    required this.status,
    required this.listingDate,
    required this.deviceRam,
    required this.createdAt,
    required this.listingId,
    required this.listingNumPrice,
    required this.listingState,
  });

  // The unique identifier of the listing.
  final String id;

  // The condition of the listed device (e.g., new, used, etc.).
  final String deviceCondition;

  // The name of the user who listed the device.
  final String listedBy;

  // The storage capacity of the listed device (e.g., 64GB, 128GB, etc.).
  final String deviceStorage;

  // A list of images associated with the listing.
  final List<ListingImage> images;

  // The default image associated with the listing.
  final ListingImage defaultImage;

  // The location of the listing.
  final String listingLocation;

  // The make of the listed device (e.g., Apple, Samsung, etc.).
  final String make;

  // The marketing name of the listed device (e.g., iPhone 12, Galaxy S21, etc.).
  final String marketingName;

  // The mobile number of the user who listed the device.
  final String mobileNumber;

  // The model of the listed device (e.g., iPhone 12 Pro, Galaxy S21 Ultra, etc.).
  final String model;

  // Indicates whether the listing is verified or not.
  final bool verified;

  // The status of the listing (e.g., active, sold, etc.).
  final String status;

  // The date when the listing was posted.
  final DateTime listingDate;

  // The RAM capacity of the listed device (e.g., 4GB, 8GB, etc.).
  final String deviceRam;

  // The date and time when the listing was created.
  final DateTime createdAt;

  // The unique identifier of the listing (another identifier, possibly different from 'id').
  final String listingId;

  // The numerical price of the listing.
  final int listingNumPrice;

  // The state associated with the listing (e.g., new, used, etc.).
  final String listingState;

  // Create an instance of 'Listing' from a JSON map.
  //
  // This factory constructor is used to deserialize a JSON map into a 'Listing' object.
  // The provided JSON map should contain keys corresponding to each property of the 'Listing' class,
  // and the corresponding values should match the type of each property.
  //
  // Parameters:
  //   json: A Map<String, dynamic> containing the listing data in JSON format.
  //
  // Returns:
  //   A 'Listing' object containing the deserialized listing data.
  //
  // Throws:
  //   FormatException: When the JSON map is not in the expected format.
  factory Listing.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          '_id': String id,
          'deviceCondition': String deviceCondition,
          'listedBy': String listedBy,
          'deviceStorage': String deviceStorage,
          'images': List<dynamic> images,
          'defaultImage': Map<String, dynamic> defaultImage,
          'listingLocation': String listingLocation,
          'make': String make,
          'marketingName': String marketingName,
          'mobileNumber': String mobileNumber,
          'model': String model,
          'verified': bool verified,
          'status': String status,
          'listingDate': String listingDate,
          'deviceRam': String deviceRam,
          'createdAt': String createdAt,
          'listingId': String listingId,
          'listingNumPrice': int listingNumPrice,
          'listingState': String listingState,
        }) {
      // Convert the 'images' list into an unmodifiable list of 'ListingImage'.
      final listingImages = List<ListingImage>.unmodifiable(
        images.map<ListingImage>(
            (e) => ListingImage.fromJson(e as Map<String, dynamic>)),
      );

      // Parse date and time strings using 'DateFormat' from the 'intl' library.
      final listingDateFormat = DateFormat('MM/dd/yyyy');
      final createdDateFormat = DateFormat("MM/dd/yyyy'T'HH:mm:ss.SSS'Z'");

      // Parse the date and time strings into 'DateTime' objects.
      final createdTime = createdDateFormat.parseUtc(createdAt);
      final dateListed = listingDateFormat.parseUtc(listingDate);

      return Listing(
        id: id,
        deviceCondition: deviceCondition,
        listedBy: listedBy,
        deviceStorage: deviceStorage,
        images: listingImages,
        defaultImage: ListingImage.fromJson(defaultImage),
        listingLocation: listingLocation,
        make: make,
        marketingName: marketingName,
        mobileNumber: mobileNumber,
        model: model,
        verified: verified,
        status: status,
        listingDate: dateListed,
        deviceRam: deviceRam,
        createdAt: createdTime,
        listingId: listingId,
        listingNumPrice: listingNumPrice,
        listingState: listingState,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Listing Item response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [
        id,
        deviceCondition,
        listedBy,
        deviceStorage,
        images,
        defaultImage,
        listingLocation,
        make,
        marketingName,
        mobileNumber,
        model,
        verified,
        status,
        listingDate,
        deviceRam,
        createdAt,
        listingId,
        listingNumPrice,
        listingState,
      ];
}

final class ListingImage extends Equatable {
  const ListingImage({
    required this.fullImage,
  });

  final String fullImage;

  factory ListingImage.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'fullImage': String fullImage,
        }) {
      return ListingImage(
        fullImage: fullImage,
      );
    } else {
      throw const FormatException(
        '''Failed to deserialize Image response.

        Reason: Invalid JSON format''',
      );
    }
  }

  @override
  List<Object?> get props => [fullImage];
}

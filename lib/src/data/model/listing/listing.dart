import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

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

  final String id;
  final String deviceCondition;
  final String listedBy;
  final String deviceStorage;
  final List<Image> images;
  final Image defaultImage;
  final String listingLocation;
  final String make;
  final String marketingName;
  final String mobileNumber;
  final String model;
  final bool verified;
  final String status;
  final String listingDate;
  final String deviceRam;
  final DateTime createdAt;
  final String listingId;
  final int listingNumPrice;
  final String listingState;

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
      final listingImages = List<Image>.unmodifiable(
        images.map((e) => Image.fromJson(
              e as Map<String, dynamic>,
            )),
      );

      final dateFormat = DateFormat("MM/dd/yyyy'T'HH:mm:ss.SSS'Z'");

      final createdTime = dateFormat.parseUtc(createdAt);

      return Listing(
        id: id,
        deviceCondition: deviceCondition,
        listedBy: listedBy,
        deviceStorage: deviceStorage,
        images: listingImages,
        defaultImage: Image.fromJson(defaultImage),
        listingLocation: listingLocation,
        make: make,
        marketingName: marketingName,
        mobileNumber: mobileNumber,
        model: model,
        verified: verified,
        status: status,
        listingDate: listingDate,
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

final class Image extends Equatable {
  const Image({
    required this.fullImage,
  });

  final String fullImage;

  factory Image.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'fullImage': String fullImage,
        }) {
      return Image(
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

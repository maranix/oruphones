// Import the required libraries.
import 'dart:convert';
import 'dart:io';

import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:oruphones/src/utils/utils.dart';

// Define a class 'AssignmentRepository' that extends 'Repository' and implements 'AssignmentI'.
// This class serves as the repository for interacting with assignments using the provided HTTP client.
final class AssignmentRepository extends Repository implements AssignmentI {
  // Constructor for the 'AssignmentRepository' class.
  // This constructor calls the super constructor of 'Repository' with the provided HTTP client.
  //
  // Parameters:
  //   client: An instance of 'http.Client' used for making HTTP requests.
  AssignmentRepository({
    required super.client,
  });

  // Method to fetch a list of assignments (listings) from the server.
  // This method overrides the 'getListings' method declared in the 'AssignmentI' interface.
  @override
  Future<Result<ListingResponse>> getListings({
    int page = 1,
    int limit = 10,
  }) async {
    // Construct the URI for the 'getListings' API endpoint.
    final uri = baseUri.copyWith(
      path: '${baseUri.path}/getListings',
      queryParameters: {
        'page': '$page',
        'limit': '$limit',
      },
    );

    try {
      // Send an HTTP GET request to the server using the provided client.
      final res = await client.get(uri);

      // Check the response status code for errors.
      if (res.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Request failed with status code : ${res.statusCode}',
          uri: uri,
        );
      }

      // Deserialize the JSON response into a 'ListingResponse' object using the 'fromJson' factory constructor.
      final listings = ListingResponse.fromJson(res.toJson());

      // Return the successful result containing the 'ListingResponse'.
      return ResultSuccess(value: listings);
    } on Exception catch (e) {
      // If an exception occurs during the process, return the failure result containing the exception.
      return ResultFailure(e);
    }
  }

  // Method to fetch filters for assignments from the server.
  // This method overrides the 'getFilters' method declared in the 'AssignmentI' interface.
  @override
  Future<Result<Filters>> getFilters({
    bool isLimited = true,
  }) async {
    // Construct the URI for the 'getFilters' API endpoint.
    final uri = baseUri.copyWith(
      path: '${baseUri.path}/getFilters',
      queryParameters: {
        'isLimited': '$isLimited',
      },
    );

    try {
      // Send an HTTP GET request to the server using the provided client.
      final res = await client.get(uri);

      // Check the response status code for errors.
      if (res.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Request failed with status code : ${res.statusCode}',
          uri: uri,
        );
      }

      // Deserialize the JSON response into a 'Filters' object using the 'fromJson' factory constructor.
      final filters = Filters.fromJson(res.toJson());

      // Return the successful result containing the 'Filters'.
      return ResultSuccess(value: filters);
    } on Exception catch (e) {
      // If an exception occurs during the process, return the failure result containing the exception.
      return ResultFailure(e);
    }
  }

  // Method to perform a search for assignments based on a model.
  // This method overrides the 'postSearchModel' method declared in the 'AssignmentI' interface.
  @override
  Future<Result<Search>> postSearchModel({required String model}) async {
    // Construct the URI for the 'searchModel' API endpoint.
    final uri = baseUri.copyWith(path: '${baseUri.path}/searchModel');

    // Encode the search model as JSON in the request body.
    final body = jsonEncode({
      'searchModel': model,
    });

    try {
      // Send an HTTP POST request to the server using the provided client.
      final res = await client.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: body,
      );

      // Check the response status code for errors.
      if (res.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Request failed with status code : ${res.statusCode}',
          uri: uri,
        );
      }

      // Deserialize the JSON response into a 'Search' object using the 'fromJson' factory constructor.
      final searchResults = Search.fromJson(res.toJson());

      // Return the successful result containing the 'Search' results.
      return ResultSuccess(value: searchResults);
    } on Exception catch (e) {
      // If an exception occurs during the process, return the failure result containing the exception.
      return ResultFailure(e);
    }
  }
}

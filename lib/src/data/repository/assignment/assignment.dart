import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/utils/utils.dart';

export './assignment_repository.dart';

// Define an interface class 'AssignmentI'.
// This interface declares three asynchronous methods for interacting with assignments.
// The methods are intended to be implemented by derived classes.
interface class AssignmentI {
  // Method to fetch a list of assignments (listings).
  // This method fetches a paginated list of assignments from the server.
  //
  // Parameters:
  //   page (optional): The page number to fetch. Default is 1.
  //   limit (optional): The number of items to fetch per page. Default is 10.
  //
  // Returns:
  //   A 'Future<Result<ListingResponse>>' representing the asynchronous result.
  //   The result contains a 'ListingResponse' object on success or an error on failure.
  Future<Result<ListingResponse>> getListings({
    int page = 1,
    int limit = 10,
  }) {
    throw UnimplementedError("getListings() Method is not yet implemented.");
  }

  // Method to fetch filters for assignments.
  // This method fetches filters for assignments from the server.
  //
  // Parameters:
  //   isLimited (optional): Whether to fetch limited filters. Default is true.
  //
  // Returns:
  //   A 'Future<Result<Filters>>' representing the asynchronous result.
  //   The result contains a 'Filters' object on success or an error on failure.
  Future<Result<Filters>> getFilters({
    bool isLimited = true,
  }) {
    throw UnimplementedError("getFilters() Method is not yet implemented.");
  }

  // Method to perform a search for assignments based on a model.
  // This method posts a search request to the server for assignments matching the specified model.
  //
  // Parameters:
  //   model: The model name to search for.
  //
  // Returns:
  //   A 'Future<Result<Search>>' representing the asynchronous result.
  //   The result contains a 'Search' object on success or an error on failure.
  Future<Result<Search>> postSearchModel({
    required String model,
  }) {
    throw UnimplementedError(
        "postSearchModel() Method is not yet implemented.");
  }
}

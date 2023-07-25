import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/utils/utils.dart';

export './assignment_repository.dart';

interface class AssignmentI {
  Future<Result<ListingResponse>> getListings({
    int page = 1,
    int limit = 10,
  }) {
    throw UnimplementedError("getListings() Method is not yet implemented.");
  }

  Future<Result<Filters>> getFilters({
    bool isLimited = true,
  }) {
    throw UnimplementedError("getFilters() Method is not yet implemented.");
  }

  Future<Result<Search>> postSearchModel({
    required String model,
  }) {
    throw UnimplementedError(
        "postSearchModel() Method is not yet implemented.");
  }
}

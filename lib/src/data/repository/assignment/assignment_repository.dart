import 'dart:convert';
import 'dart:io';

import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:oruphones/src/utils/utils.dart';

final class AssignmentRepository extends Repository implements AssignmentI {
  AssignmentRepository({
    required super.client,
  });

  @override
  Future<Result<ListingResponse>> getListings({
    int page = 1,
    int limit = 10,
  }) async {
    final uri = baseUri.copyWith(
      path: '${baseUri.path}/getListings',
      queryParameters: {
        'page': '$page',
        'limit': '$limit',
      },
    );

    try {
      final res = await client.get(uri);

      if (res.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Request failed with status code : ${res.statusCode}',
          uri: uri,
        );
      }

      final listings = ListingResponse.fromJson(res.toJson());

      return ResultSuccess(value: listings);
    } on Exception catch (e) {
      return ResultFailure(e);
    }
  }

  @override
  Future<Result<Filters>> getFilters({
    bool isLimited = true,
  }) async {
    final uri = baseUri.copyWith(
      path: '${baseUri.path}/getFilters',
      queryParameters: {
        'isLimited': '$isLimited',
      },
    );

    try {
      final res = await client.get(uri);

      if (res.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Request failed with status code : ${res.statusCode}',
          uri: uri,
        );
      }

      final filters = Filters.fromJson(res.toJson());

      return ResultSuccess(value: filters);
    } on Exception catch (e) {
      return ResultFailure(e);
    }
  }

  @override
  Future<Result<Search>> postSearchModel({required String model}) async {
    final uri = baseUri.copyWith(path: '${baseUri.path}/searchModel');
    final body = jsonEncode({
      'searchModel': model,
    });

    try {
      final res = await client.post(
        uri,
        body: body,
      );

      if (res.statusCode != HttpStatus.ok) {
        throw HttpException(
          'Request failed with status code : ${res.statusCode}',
          uri: uri,
        );
      }

      final searchResults = Search.fromJson(res.toJson());

      return ResultSuccess(value: searchResults);
    } on Exception catch (e) {
      return ResultFailure(e);
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/data/repository/assignment/assignment.dart';
import 'package:oruphones/src/features/home/home.dart';
import 'package:oruphones/src/utils/utils.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required AssignmentI repo,
  })  : _repo = repo,
        super(const HomeInitial()) {
    on<HomeListingsFetched>(_onListingsFetched);
    on<HomeMoreListingsFetched>(_onMoreListingsFetched);
  }

  Future<void> _onListingsFetched(
    HomeListingsFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    final result = await _repo.getListings();

    return switch (result) {
      ResultSuccess() => emit(HomeLoaded(result.value)),
      ResultFailure() => emit(_handleException(exception: result.err)),
    };
  }

  Future<void> _onMoreListingsFetched(
    HomeMoreListingsFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingMore());

    final result = await _repo.getListings(
      page: _getNextPageFromCurrentState(state),
    );

    return switch (result) {
      ResultSuccess() => emit(
          HomeLoaded(
            _getNewListingsFromResponse(
              response: result.value,
              state: state,
            ),
          ),
        ),
      ResultFailure() => emit(_handleException(exception: result.err)),
    };
  }

  int _getNextPageFromCurrentState(HomeState state) {
    return switch (state) {
      HomeLoaded() => state.data.nextPage,
      _ => 1,
    };
  }

  ListingResponse _getNewListingsFromResponse({
    required ListingResponse response,
    required HomeState state,
  }) {
    final oldListings = switch (state) {
      HomeLoaded() => state.data.listings,
      _ => [],
    };

    return response.copyWith(
      listings: List.unmodifiable(
        [...response.listings, ...oldListings],
      ),
    );
  }

  HomeState _handleException({
    required Exception exception,
  }) {
    return switch (exception) {
      HttpException() => const HomeRequestFailure(),
      SocketException() => const HomeRequestFailure(),
      TimeoutException() => const HomeRequestTimeoutFailure(),
      _ => const HomeFailed(),
    };
  }

  final AssignmentI _repo;
}

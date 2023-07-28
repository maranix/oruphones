import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/data/repository/assignment/assignment.dart';
import 'package:oruphones/src/features/home/home.dart';
import 'package:oruphones/src/utils/utils.dart';

part 'home_event.dart';
part 'home_state.dart';

// Define a class 'HomeBloc' that extends 'Bloc<HomeEvent, HomeState>'.
// This class manages the state and business logic of the 'Home' feature in the application.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // Constructor for the 'HomeBloc' class.
  // This constructor creates a new instance of 'HomeBloc' with the provided assignment repository.
  //
  // Parameters:
  //   repo: An instance of 'AssignmentI' for fetching home listings.
  HomeBloc({
    required AssignmentI repo,
  })  : _repo = repo,
        super(const HomeInitial()) {
    // Register event handlers using the 'on' method.
    on<HomeFetched>(_onListingsFetched);
    on<HomeMoreListingsFetched>(_onMoreListingsFetched);
  }

  // Method to handle the 'HomeListingsFetched' event.
  // This method is called when the 'HomeListingsFetched' event is triggered.
  Future<void> _onListingsFetched(
    HomeFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    final result = await Future.wait([
      _repo.getListings(),
      _repo.getFilters(),
    ]);

    final listingsResult = result.whereType<Result<ListingResponse>>().first;
    final filtersResult = result.whereType<Result<Filters>>().first;

    // Handle the result based on success or failure.
    try {
      final listings = switch (listingsResult) {
        ResultSuccess() => listingsResult.value,
        ResultFailure() => throw listingsResult.err
      };

      final filters = switch (filtersResult) {
        ResultSuccess() => filtersResult.value,
        ResultFailure() => throw filtersResult.err,
      };

      emit(
        HomeLoaded(
          data: listings,
          filters: filters,
        ),
      );
    } on Exception catch (e) {
      emit(_handleException(exception: e));
    }
  }

  // Method to handle the 'HomeMoreListingsFetched' event.
  // This method is called when the 'HomeMoreListingsFetched' event is triggered.
  Future<void> _onMoreListingsFetched(
    HomeMoreListingsFetched event,
    Emitter<HomeState> emit,
  ) async {
    // Get the current listings from the current state.
    final currentListings = _getCurrentListings(state: state);

    // Get the current filters from the current state.
    final currentFilters = _getCurrentFilters(state: state);

    // Emit the 'HomeLoadingMore' state with the current listings.
    emit(HomeLoadingMore(listingData: currentListings, filters: currentFilters));

    // Fetch more listings from the repository with the next page number.
    final result = await _repo.getListings(
      page: _getNextPageFromCurrentState(state),
    );

    // Handle the result based on success or failure.
    try {
      final newListings = switch (result) {
        ResultSuccess() => _getNewListingsFromResponse(
            response: result.value,
            state: state,
          ),
        ResultFailure() => throw Exception(),
      };

      emit(HomeLoaded(data: newListings, filters: currentFilters));
    } on Exception catch (e) {
      emit(_handleException(exception: e));
    }
  }

  // Method to get the next page number from the current state.
  int _getNextPageFromCurrentState(HomeState state) {
    return switch (state) {
      HomeLoaded() => state.data.nextPage,
      _ => 1,
    };
  }

  // Method to get the new listings from the response and current state.
  ListingResponse _getNewListingsFromResponse({
    required ListingResponse response,
    required HomeState state,
  }) {
    final oldListings = _getCurrentListings(state: state).listings;

    // Merge the old listings with the new listings from the response.
    final listings = List<Listing>.unmodifiable(
      [...oldListings, ...response.listings],
    );

    // Create a new ListingResponse with the merged listings.
    return response.copyWith(
      listings: listings,
    );
  }

  // Method to get the current listing response from the current state.
  ListingResponse _getCurrentListings({
    required HomeState state,
  }) {
    return switch (state) {
      HomeLoaded() => state.data,
      HomeLoadingMore() => state.listingData,
      _ => const ListingResponse(
          listings: [],
          message: "",
          nextPage: 11,
        ),
    };
  }

  // Method to get the current filters response from the current state.
  Filters _getCurrentFilters({
    required HomeState state,
  }) {
    return switch (state) {
      HomeLoaded() => state.filters,
      HomeLoadingMore() => state.filters,
      _ => const Filters(
          make: [],
          condition: [],
          ram: [],
          storage: [],
        ),
    };
  }

  // Method to handle exceptions and return corresponding states.
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

  // Private field to store the assignment repository instance.
  final AssignmentI _repo;
}

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
    on<HomeListingsFetched>(_onListingsFetched);
    on<HomeMoreListingsFetched>(_onMoreListingsFetched);
  }

  // Method to handle the 'HomeListingsFetched' event.
  // This method is called when the 'HomeListingsFetched' event is triggered.
  Future<void> _onListingsFetched(
    HomeListingsFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    // Fetch the initial listings from the repository.
    final result = await _repo.getListings();

    // Handle the result based on success or failure.
    return switch (result) {
      ResultSuccess() => emit(HomeLoaded(result.value)),
      ResultFailure() => emit(_handleException(exception: result.err)),
    };
  }

  // Method to handle the 'HomeMoreListingsFetched' event.
  // This method is called when the 'HomeMoreListingsFetched' event is triggered.
  Future<void> _onMoreListingsFetched(
    HomeMoreListingsFetched event,
    Emitter<HomeState> emit,
  ) async {
    // Get the current listings from the current state.
    final currentListings = _getCurrentListingResponse(state: state);

    // Emit the 'HomeLoadingMore' state with the current listings.
    emit(HomeLoadingMore(currentListings));

    // Fetch more listings from the repository with the next page number.
    final result = await _repo.getListings(
      page: _getNextPageFromCurrentState(state),
    );

    // Handle the result based on success or failure.
    return switch (result) {
      ResultSuccess() => emit(
          HomeLoaded(
            _getNewListingsFromResponse(
              response: result.value,
              state: state,
            ),
          ),
        ),
      ResultFailure() => emit(
          _handleException(exception: result.err),
        ),
    };
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
    final oldListings = _getCurrentListingResponse(state: state).listings;

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
  ListingResponse _getCurrentListingResponse({
    required HomeState state,
  }) {
    return switch (state) {
      HomeLoaded() => state.data,
      HomeLoadingMore() => state.data,
      _ => const ListingResponse(
          listings: [],
          message: "",
          nextPage: 11,
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

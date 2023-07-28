part of 'home_bloc.dart';

// Define a sealed class 'HomeState' that extends 'Equatable'.
// This class represents the various states that the 'HomeBloc' can be in.
sealed class HomeState extends Equatable {
  // Constructor for the 'HomeState' class.
  const HomeState();

  // Override the 'props' getter to ensure object equality comparison.
  @override
  List<Object?> get props => [];
}

// Define a subclass 'HomeInitial' of 'HomeState'.
// This class represents the initial state of the 'HomeBloc'.
final class HomeInitial extends HomeState {
  // Constructor for the 'HomeInitial' class.
  const HomeInitial();
}

// Define a subclass 'HomeLoading' of 'HomeState'.
// This class represents the state when home listings are being fetched.
final class HomeLoading extends HomeState {
  // Constructor for the 'HomeLoading' class.
  const HomeLoading();
}

// Define a subclass 'HomeLoadingMore' of 'HomeState'.
// This class represents the state when more home listings are being fetched.
final class HomeLoadingMore extends HomeState {
  // Constructor for the 'HomeLoadingMore' class.
  const HomeLoadingMore({required this.listingData, required this.filters});

  // Listing data.
  final ListingResponse listingData;

  final Filters filters;

  // Override the 'props' getter to ensure object equality comparison.
  @override
  List<Object?> get props => [listingData, filters];
}

// Define a subclass 'HomeLoaded' of 'HomeState'.
// This class represents the state when home listings have been successfully loaded.
final class HomeLoaded extends HomeState {
  // Constructor for the 'HomeLoaded' class.
  const HomeLoaded({
    required this.data,
    required this.filters,
  });

  // A variable to store the listing response data.
  final ListingResponse data;

  // Filters data.
  final Filters filters;

  HomeLoaded copyWith({
    ListingResponse? data,
    Filters? filters,
  }) {
    return HomeLoaded(
      data: data ?? this.data,
      filters: filters ?? this.filters,
    );
  }

  // Override the 'props' getter to ensure object equality comparison.
  @override
  List<Object?> get props => [data, filters];
}

// Define a subclass 'HomeFailed' of 'HomeState'.
// This class represents the state when an error occurs while fetching home listings.
final class HomeFailed extends HomeState {
  // Constructor for the 'HomeFailed' class.
  const HomeFailed();
}

// Define a subclass 'HomeRequestTimeoutFailure' of 'HomeState'.
// This class represents the state when a request to fetch home listings times out.
final class HomeRequestTimeoutFailure extends HomeState {
  // Constructor for the 'HomeRequestTimeoutFailure' class.
  const HomeRequestTimeoutFailure();
}

// Define a subclass 'HomeRequestFailure' of 'HomeState'.
// This class represents the state when a request to fetch home listings fails.
final class HomeRequestFailure extends HomeState {
  // Constructor for the 'HomeRequestFailure' class.
  const HomeRequestFailure();
}

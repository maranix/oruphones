part of 'home_bloc.dart';

// Define a sealed class 'HomeEvent' that extends 'Equatable'.
// This class represents the events that can occur in the 'HomeBloc'.
sealed class HomeEvent extends Equatable {
  // Constructor for the 'HomeEvent' class.
  const HomeEvent();

  // Override the 'props' getter to ensure object equality comparison.
  @override
  List<Object?> get props => [];
}

// Define a subclass 'HomeListingsFetched' of 'HomeEvent'.
// This class represents the event when the initial home listings are fetched.
final class HomeListingsFetched extends HomeEvent {
  const HomeListingsFetched();
}

// Define a subclass 'HomeMoreListingsFetched' of 'HomeEvent'.
// This class represents the event when more home listings are fetched.
final class HomeMoreListingsFetched extends HomeEvent {
  const HomeMoreListingsFetched();
}

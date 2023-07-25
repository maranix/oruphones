part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

}

final class HomeListingsFetched extends HomeEvent {
  const HomeListingsFetched();

  @override
  List<Object?> get props => [];
}

final class HomeMoreListingsFetched extends HomeEvent {
  const HomeMoreListingsFetched();

  @override
  List<Object?> get props => [];
}


part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

}

final class HomeListingsFetched extends HomeEvent {
  const HomeListingsFetched();

  @override
  List<Object?> get props => [];
}

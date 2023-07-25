part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoading extends HomeState {
  const HomeLoading();
}

final class HomeLoadingMore extends HomeState {
  const HomeLoadingMore();
}

final class HomeLoaded extends HomeState {
  const HomeLoaded(this.data);

  final ListingResponse data;

  @override
  List<Object?> get props => [data];
}

final class HomeFailed extends HomeState {
  const HomeFailed();
}

final class HomeRequestTimeoutFailure extends HomeState {
  const HomeRequestTimeoutFailure();
}

final class HomeRequestFailure extends HomeState {
  const HomeRequestFailure();
}

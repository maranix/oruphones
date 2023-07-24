import 'package:equatable/equatable.dart';
import 'package:oruphones/data/model/model.dart';
import 'package:oruphones/data/repository/assignment/assignment.dart';
import 'package:oruphones/src/home/home.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required AssignmentI repo,
  })  : _repo = repo,
        super(const HomeInitial()) {
    on<HomeListingsFetched>(_onListingsFetched);
  }

  Future<void> _onListingsFetched(
    HomeListingsFetched event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    final result = await _repo.getListings();

    return switch (result) {
      ResultSuccess() => emit(HomeLoaded(result.value)),
      ResultFailure() => emit(const HomeFailed()),
    };
  }

  final AssignmentI _repo;
}

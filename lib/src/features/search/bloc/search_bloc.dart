import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oruphones/src/data/model/model.dart';
import 'package:oruphones/src/data/repository/repository.dart';
import 'package:oruphones/src/utils/result/result.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required AssignmentI repo,
  })  : _repo = repo,
        super(const SearchInitial()) {
    on<SearchAutoComplete>(
      _onAutoComplete,
      transformer: (events, mapper) => events
          .debounce(
            const Duration(milliseconds: 500),
          )
          .switchMap(mapper),
    );
    on<SearchReset>(_onReset);
  }

  Future<void> _onAutoComplete(
    SearchAutoComplete event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchLoading());

    final res = await _repo.postSearchModel(
      model: event.query ?? '',
    );

    return switch (res) {
      ResultSuccess() => emit(SearchLoaded(res.value)),
      ResultFailure() => emit(const SearchFailed()),
    };
  }

  void _onReset(
    SearchReset event,
    Emitter<SearchState> emit,
  ) {
    emit(const SearchInitial());
  }

  final AssignmentI _repo;
}

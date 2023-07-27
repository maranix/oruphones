part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

final class SearchAutoComplete extends SearchEvent {
  const SearchAutoComplete(this.query);

  final String? query;

  @override
  List<Object?> get props => [query];
}

final class SearchReset extends SearchEvent {
  const SearchReset();
}

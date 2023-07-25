import 'package:equatable/equatable.dart';

sealed class Result<R> extends Equatable {
  const Result();
}

final class ResultSuccess<T> extends Result<T> {
  const ResultSuccess({
    required this.value,
  });

  final T value;

  @override
  List<Object?> get props => [value];
}

final class ResultFailure extends Result<Never> {
  const ResultFailure(this.err);

  final Exception err;

  @override
  List<Object?> get props => [err];
}

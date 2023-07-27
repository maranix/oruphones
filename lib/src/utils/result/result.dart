// Import the required library for the 'Result' class to extend 'Equatable'.
import 'package:equatable/equatable.dart';

// Define a sealed class 'Result' that extends 'Equatable'.
// The 'Result' class is intended to represent the outcome of an operation
// that can either be successful (ResultSuccess) or a failure (ResultFailure).
sealed class Result<R> extends Equatable {
  const Result();
}

// Define a class 'ResultSuccess' that extends 'Result'.
// This class represents a successful outcome of an operation and contains
// a value of type 'T'.
final class ResultSuccess<T> extends Result<T> {
  const ResultSuccess({
    required this.value,
  });

  // The value representing the successful outcome.
  final T value;

  @override
  List<Object?> get props => [value];
}

// Define a class 'ResultFailure' that extends 'Result'.
// This class represents a failure outcome of an operation and contains an
// Exception 'err' that describes the reason for the failure.
final class ResultFailure extends Result<Never> {
  const ResultFailure(this.err);

  // The Exception representing the reason for the failure.
  final Exception err;

  @override
  List<Object?> get props => [err];
}

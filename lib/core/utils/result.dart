import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// Result type for handling success and error states
sealed class Result<T> extends Equatable {
  const Result();

  /// Creates a successful result with data
  const factory Result.ok(T data) = Ok<T>;

  /// Creates an error result with failure
  const factory Result.err(Failure failure) = Err<T>;

  /// Returns true if this is a successful result
  bool get isOk => this is Ok<T>;

  /// Returns true if this is an error result
  bool get isErr => this is Err<T>;

  /// Returns the data if this is a successful result, null otherwise
  T? get data => isOk ? (this as Ok<T>).data : null;

  /// Returns the failure if this is an error result, null otherwise
  Failure? get failure => isErr ? (this as Err<T>).failure : null;

  /// Maps the data if this is a successful result
  Result<U> map<U>(U Function(T) mapper) {
    return switch (this) {
      Ok<T>(data: final data) => Result.ok(mapper(data)),
      Err<T>(failure: final failure) => Result.err(failure),
    };
  }

  /// Maps the data if this is a successful result, or returns a default value
  U mapOr<U>(U Function(T) mapper, U defaultValue) {
    return switch (this) {
      Ok<T>(data: final data) => mapper(data),
      Err<T>() => defaultValue,
    };
  }
}

/// Successful result containing data
class Ok<T> extends Result<T> {
  const Ok(this.data);

  @override
  final T data;

  @override
  List<Object?> get props => [data];
}

/// Error result containing failure
class Err<T> extends Result<T> {
  const Err(this.failure);

  @override
  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

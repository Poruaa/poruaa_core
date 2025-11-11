// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Utility class to wrap result data
///
/// Evaluate the result using a switch statement:
/// ```dart
/// switch (result) {
///   case Ok(): {
///     print(result.value);
///   }
///   case Error(): {
///     print(result.error);
///   }
/// }
/// ```
sealed class Result<T> {
  const Result();

  /// Creates a successful [Result], completed with the specified [value].
  const factory Result.ok(T value) = Ok;

  /// Creates an error [Result], completed with the specified [error].
  const factory Result.error(Object? error) = Err;

  Result<M> map<M>(
    M Function(T value) toElement,
  ) {
    switch (this) {
      case Ok<T>(:final value):
        return Result.ok(toElement(value));
      case Err<T>(:final error):
        return Result.error(error);
    }
  }

  R fold<R>(
    R Function(T value) toElement,
    R Function(Object? error) toError,
  ) {
    switch (this) {
      case Ok<T>(:final value):
        return toElement(value);
      case Err<T>(:final error):
        return toError(error);
    }
  }

  R? foldNullable<R>(
    R Function(T value) toElement,
    R Function(Object? error) toError,
  ) {
    switch (this) {
      case Ok<T>(:final value):
        return toElement(value);
      case Err<T>(:final error):
        return toError(error);
    }
  }

  T? toNullable<R>() {
    switch (this) {
      case Ok<T>(:final value):
        return value;
      case Err<T>():
        return null;
    }
  }
}

/// Subclass of Result for values
final class Ok<T> extends Result<T> {
  const Ok(this.value);

  /// Returned value in result
  final T value;

  @override
  String toString() => 'Result<$T>.ok($value)';
}

/// Subclass of Result for errors
final class Err<T> extends Result<T> {
  const Err(this.error);

  /// Returned error in result
  final Object? error;

  @override
  String toString() => 'Result<$T>.error($error)';
}

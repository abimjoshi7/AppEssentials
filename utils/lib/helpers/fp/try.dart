part of 'fp.dart';

// A class to handle exceptions gracefully during function execution.
sealed class Try<T> {
  const Try();

  factory Try.of(T Function() action) {
    try {
      return Success<T>(action());
    } catch (e) {
      return Failure<T>(e);
    }
  }
}

final class Success<T> extends Try<T> {
  final T value;
  const Success(this.value);
}

final class Failure<T> extends Try<T> {
  final Object error;
  const Failure(this.error);
}

extension TryExtensions<T> on Try<T> {
  bool isSuccess() => this is Success<T>;
  bool isFailure() => this is Failure<T>;

  T? get value => this is Success<T> ? (this as Success<T>).value : null;
  Object? get error => this is Failure<T> ? (this as Failure<T>).error : null;

  T getOrElse(T Function() fallback) {
    if (this is Success<T>) return (this as Success<T>).value;
    return fallback();
  }

  Try<R> map<R>(R Function(T value) transform) {
    if (this is Success<T>) {
      return Try.of(() => transform((this as Success<T>).value));
    }
    return this as Try<R>;
  }

  Try<R> flatMap<R>(Try<R> Function(T value) transform) {
    if (this is Success<T>) {
      return transform((this as Success<T>).value);
    }
    return this as Try<R>;
  }
}

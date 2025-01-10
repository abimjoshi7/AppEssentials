sealed class Either<L, R> {
  const Either();
}

final class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);
}

final class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);
}

extension EitherExtensions<L, R> on Either<L, R> {
  bool isLeft() => this is Left<L, R>;
  bool isRight() => this is Right<L, R>;

  R? get right => this is Right<L, R> ? (this as Right<L, R>).value : null;
  L? get left => this is Left<L, R> ? (this as Left<L, R>).value : null;

  T fold<T>(T Function(L left) onLeft, T Function(R right) onRight) {
    if (this is Left<L, R>) return onLeft((this as Left<L, R>).value);
    return onRight((this as Right<L, R>).value);
  }

  Either<L, T> map<T>(T Function(R right) transform) {
    if (this is Right<L, R>) {
      return Right<L, T>(transform((this as Right<L, R>).value));
    }
    return this as Either<L, T>;
  }

  Either<T, R> mapLeft<T>(T Function(L left) transform) {
    if (this is Left<L, R>) {
      return Left<T, R>(transform((this as Left<L, R>).value));
    }
    return this as Either<T, R>;
  }

  Either<L, T> flatMap<T>(Either<L, T> Function(R right) transform) {
    if (this is Right<L, R>) {
      return transform((this as Right<L, R>).value);
    }
    return this as Either<L, T>;
  }
}

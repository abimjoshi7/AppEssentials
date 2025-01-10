// A class for nullable values, similar to Maybe in Haskell.
sealed class Option<T> {
  const Option();
}

final class Some<T> extends Option<T> {
  final T value;
  const Some(this.value);
}

final class None<T> extends Option<T> {
  const None();
}

extension OptionExtensions<T> on Option<T> {
  bool isSome() => this is Some<T>;
  bool isNone() => this is None<T>;

  T? get value => this is Some<T> ? (this as Some<T>).value : null;

  T getOrElse(T Function() fallback) {
    if (this is Some<T>) return (this as Some<T>).value;
    return fallback();
  }

  Option<R> map<R>(R Function(T value) transform) {
    if (this is Some<T>) {
      return Some<R>(transform((this as Some<T>).value));
    }
    return None<R>();
  }

  Option<R> flatMap<R>(Option<R> Function(T value) transform) {
    if (this is Some<T>) {
      return transform((this as Some<T>).value);
    }
    return None<R>();
  }
}

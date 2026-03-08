sealed class Either<L, R> {}

final class Left<L, R> extends Either<L, R> {
  final L _value;

  Left(this._value);

  L get value => _value;
}

final class Right<L, R> extends Either<L, R> {
  final R _value;

  Right(this._value);

  R get value => _value;
}

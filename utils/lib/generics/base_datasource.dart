import 'dart:async';

import 'package:utils/utils.dart';

abstract class RemoteDataSource<T> {
  FutureOr<Either<Exception, List<T>>> fetchAll({int? page, int? pageSize});
  FutureOr<Either<Exception, T>> fetchById(String id);
  FutureOr<Either<Exception, T>> create(T item);
  FutureOr<Either<Exception, T>> update(String id, T item);
  FutureOr<Either<Exception, None>> delete(String id);
}

abstract class LocalDataSource<T> {
  FutureOr<Either<Exception, List<T>>> fetchAll();
  FutureOr<Either<Exception, T?>> fetchById(String id);
  FutureOr<Either<Exception, int>> save(T item);
  FutureOr<Either<Exception, int>> delete(String id);
  FutureOr<Either<Exception, int>> clearCache();
}

import 'dart:async';

import 'package:utils/utils.dart';

abstract class RemoteDataSource<T> {
  FutureOr<Either<AppException, List<T>>> fetchAll({int? page, int? pageSize});
  FutureOr<Either<AppException, T>> fetchById(String id);
  FutureOr<Either<AppException, T>> create(T item);
  FutureOr<Either<AppException, T>> update(String id, T item);
  FutureOr<Either<AppException, None>> delete(String id);
}

abstract class LocalDataSource<T> {
  FutureOr<Either<AppException, List<T>>> fetchAll();
  FutureOr<Either<AppException, T?>> fetchById(String id);
  FutureOr<Either<AppException, int>> save(T item);
  FutureOr<Either<AppException, int>> delete(String id);
  FutureOr<Either<AppException, int>> clearCache();
}

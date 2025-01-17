import 'package:utils/utils.dart';

abstract class RemoteDataSource<T> {
  Future<Either<AppException, List<T>>> fetchAll({int? page, int? pageSize});
  Future<Either<AppException, T>> fetchById(String id);
  Future<Either<AppException, T>> create(T item);
  Future<Either<AppException, T>> update(String id, T item);
  Future<Either<AppException, None>> delete(String id);
}

abstract class LocalDataSource<T> {
  Future<Either<AppException, List<T>>> fetchAll();
  Future<Either<AppException, T?>> fetchById(String id);
  Future<Either<AppException, int>> save(T item);
  Future<Either<AppException, int>> delete(String id);
  Future<Either<AppException, int>> clearCache();
}

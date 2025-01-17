import 'package:utils/utils.dart';

abstract class BaseRepository<T> {
  /// Fetch a list of items, optionally paginated.
  Future<Either<AppException, List<T>>> fetchAll({int? page, int? pageSize});

  /// Fetch a single item by its ID.
  Future<Either<AppException, T>> fetchById(String id);

  /// Create a new item.
  Future<Either<AppException, T>> create(T item);

  /// Update an existing item.
  Future<Either<AppException, T>> update(String id, T item);

  /// Delete an item by its ID.
  Future<Either<AppException, void>> delete(String id);
}

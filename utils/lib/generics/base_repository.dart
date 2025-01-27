import 'dart:async';

import 'package:utils/utils.dart';

abstract class BaseRepository<T> {
  /// Fetch a list of items, optionally paginated.
  FutureOr<Either<AppException, List<T>>> fetchAll({int? page, int? pageSize});

  /// Fetch a single item by its ID.
  FutureOr<Either<AppException, T>> fetchById(String id);

  /// Create a new item.
  FutureOr<Either<AppException, T>> create(T item);

  /// Update an existing item.
  FutureOr<Either<AppException, T>> update(String id, T item);

  /// Delete an item by its ID.
  FutureOr<Either<AppException, void>> delete(String id);
}

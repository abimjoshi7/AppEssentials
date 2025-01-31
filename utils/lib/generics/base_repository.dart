import 'dart:async';

import 'package:utils/utils.dart';

abstract class BaseRepository<T> {
  /// Fetch a list of items, optionally paginated.
  FutureOr<Either<Exception, List<T>>> fetchAll({int? page, int? pageSize});

  /// Fetch a single item by its ID.
  FutureOr<Either<Exception, T>> fetchById(String id);

  /// Create a new item.
  FutureOr<Either<Exception, T>> create(T item);

  /// Update an existing item.
  FutureOr<Either<Exception, T>> update(String id, T item);

  /// Delete an item by its ID.
  FutureOr<Either<Exception, void>> delete(String id);
}

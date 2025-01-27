import 'dart:async';

import 'package:utils/utils.dart';

abstract class UseCase<T, P> {
  FutureOr<Either<AppException, T>> call(P params);
}

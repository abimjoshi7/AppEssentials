import 'package:utils/utils.dart';

abstract class UseCase<T, P> {
  Either<AppException, T> call(P params);
}

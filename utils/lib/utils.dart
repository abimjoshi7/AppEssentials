library utils;

export 'constants/constants.dart';
export 'enums/enums.dart';
export 'error/error.dart';
export 'extensions/extensions.dart';
export 'mixins/mixins.dart';
export 'res/res.dart';

const kUtilPackage = 'packages/utils/';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

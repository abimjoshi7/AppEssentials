export 'fp/fp.dart';

// void main() {
//   // Either Example
//   final either = divide(10, 0);
//   print(either.fold(
//     (left) => 'Error: $left',
//     (right) => 'Result: $right',
//   )); // Output: Error: Cannot divide by zero

//   // Try Example
//   final tryResult = Try.of(() => riskyOperation());
//   print(tryResult is Success
//       ? 'Success: ${tryResult.value}'
//       : 'Failure: ${tryResult.error}');

//   // Option Example
//   final option = findValue(5);
//   print(option.isSome() ? 'Found: ${option.value}' : 'Not Found');
// }

// // Helper for Either
// Either<String, double> divide(int a, int b) {
//   if (b == 0) {
//     return Left('Cannot divide by zero');
//   }
//   return Right(a / b);
// }

// // Helper for Try
// int riskyOperation() {
//   if (DateTime.now().second % 2 == 0) throw Exception('Random Failure');
//   return 42;
// }

// // Helper for Option
// Option<int> findValue(int search) {
//   final list = [1, 2, 3, 4];
//   return list.contains(search) ? Some(search) : None();
// }

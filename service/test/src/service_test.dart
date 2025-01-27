// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:service/service.dart';

void main() {
  group('Service', () {
    test('can be instantiated', () {
      expect(Service(), isNotNull);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import '../lib/calculator.dart';

void main() {
  group('String Calculator', () {
    test('should return 0 for an empty string', () {
      expect(Add(''), 0);
    });

    test('should return the number itself for a single number', () {
      expect(Add('1'), 1);
    });

    test('should return the sum of two numbers separated by a comma', () {
      expect(Add('1,2'), 3);
    });

    test('should handle an unknown amount of numbers', () {
      expect(Add('1,2,3,4,5'), 15);
    });

  });
}

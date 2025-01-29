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

    test('should handle new lines as delimiters', () {
      expect(Add('1\n2,3'), 6);
    });

    test('should throw an exception for invalid input', () {
      expect(() => Add('1,\n'), throwsA(isA<FormatException>()));
    });

    test('should support different delimiters', () {
      expect(Add('//;\n1;2'), 3);
    });

    test('should throw an exception for negative numbers', () {
      expect(() => Add('-1,2,-3'), throwsA(isA<Exception>()));
    });

    test('should ignore numbers greater than 1000', () {
      expect(Add('2,1001'), 2);
    });

    test('should support delimiters of any length', () {
      expect(Add('//[***]\n1***2***3'), 6);
    });

    test('should support multiple delimiters', () {
      expect(Add('//[*][%]\n1*2%3'), 6);
    });

    test('should support multiple delimiters of any length', () {
      expect(Add('//[**][%%]\n1**2%%3'), 6);
    });
  });
}

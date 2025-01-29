int Add(String numbers) {

  // Empty string
  if (numbers.isEmpty) {
    return 0;
  }

  // Default delimiters
  final delimiters = [',', '\n'];
  String delimiterPattern = ',|\n';

  // Custom delimiters
  if (numbers.startsWith('//')) {
    final delimiterEndIndex = numbers.indexOf('\n');
    final delimiterSection = numbers.substring(2, delimiterEndIndex);
    final customDelimiters = delimiterSection.split(RegExp(r'\[|\]')).where((d) => d.isNotEmpty).toList();
    delimiters.addAll(customDelimiters);
    delimiterPattern = customDelimiters.map(RegExp.escape).join('|');
    numbers = numbers.substring(delimiterEndIndex + 1);
  }

  // Parse numbers
  final numberList = numbers.split(RegExp(delimiterPattern)).map(int.parse).toList();

  // Check for negatives
  final negatives = numberList.where((n) => n < 0).toList();

  if (negatives.isNotEmpty) {
    throw Exception('Negatives not allowed: ${negatives.join(', ')}');
  }

  return numberList.where((n) => n <= 1000).fold(0, (sum, n) => sum + n);
}

int Add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  }

  String delimiterPattern = ',|\n';


  final numberList = numbers.split(RegExp(delimiterPattern)).map(int.parse).toList();
  final negatives = numberList.where((n) => n < 0).toList();

  if (negatives.isNotEmpty) {
    throw Exception('Negatives not allowed: ${negatives.join(', ')}');
  }

  return numberList.where((n) => n <= 1000).fold(0, (sum, n) => sum + n);
}

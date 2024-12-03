int day3Part1(String input) {
  final matches = RegExp('mul\\((\\d+),(\\d+)\\)').allMatches(input);

  int sum = 0;
  for (var match in matches) {
    var [a, b] = match.groups([1, 2]).map((e) => int.parse(e!)).toList();
    sum += a * b;
  }
  return sum;
}

int day3Part2(String input) {
  final matches =
      RegExp('mul\\((\\d+),(\\d+)\\)|do(n\'t)?\\(\\)').allMatches(input);

  bool enabled = true;
  int sum = 0;

  for (var match in matches) {
    var [symbol, v1, v2] = match.groups([0, 1, 2]);
    final a = int.parse(v1 ?? '0');
    final b = int.parse(v2 ?? '0');

    if (symbol == "don't()") {
      enabled = false;
    } else if (symbol == 'do()') {
      enabled = true;
    } else if (enabled) {
      sum += a * b;
    }
  }

  return sum;
}

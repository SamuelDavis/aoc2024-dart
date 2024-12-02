(List<int>, List<int>) parseInput(String input) {
  List<int> left = [];
  List<int> right = [];

  for (var e in input.trim().split('\n')) {
    var ([a, b]) = e.split(RegExp('\\s+')).map((e) => int.parse(e)).toList();
    left.add(a);
    right.add(b);
  }

  return (left, right);
}

int day1Part1(String input) {
  var (left, right) = parseInput(input);

  left.sort();
  right.sort();

  int sum = 0;
  for (var (i, a) in left.indexed) {
    var b = right[i];
    var d = b - a;
    sum += d.abs();
  }
  return sum;
}

int day1Part2(String input) {
  var (left, right) = parseInput(input);

  var sum = 0;
  for (var a in left) {
    sum += a * right.where((b) => b == a).length;
  }
  return sum;
}

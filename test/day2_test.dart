import 'package:aoc2024_dart/day2.dart';
import 'package:test/test.dart';

void main() {
  final String input = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
""";

  test('day2Part1', () => expect(day2Part1(input), 2));
  test('day2Part2', () {
    expect(day2Part2(input, 0), 2);
    expect(day2Part2(input, 1), 4);
  });
}

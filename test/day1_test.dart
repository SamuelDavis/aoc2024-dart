import 'package:aoc2024_dart/day1.dart';
import 'package:test/test.dart';

void main() {
  final String input = """
3   4
4   3
2   5
1   3
3   9
3   3
""";

  test('day1Part1', () => expect(day1Part1(input), 11));
  test('day1Part2', () => expect(day1Part2(input), 31));
}

import 'package:aoc2024_dart/day3.dart';
import 'package:test/test.dart';

void main() {
  test('day3Part1', () {
    final String input = """
xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
""";
    expect(day3Part1(input), 161);
  });
  test('day3Part2', () {
    final String input = """
xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
""";
    expect(day3Part2(input), 48);
  });
}

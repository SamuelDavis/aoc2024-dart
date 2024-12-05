import 'package:aoc2024_dart/day4.dart';
import 'package:test/test.dart';

void main() {
  test('day4Part1', () {
    final String input = """
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
""";
    expect(day4Part1(input), 18);
  });
}

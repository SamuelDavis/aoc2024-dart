int day4Part1(String input) {
  List<(int, int)> leftToRight = [(1, 0), (2, 0), (3, 0)];
  List<(int, int)> rightToLeft = [(-1, 0), (-2, 0), (-3, 0)];
  List<(int, int)> topToBottom = [(0, 1), (0, 2), (0, 3)];
  List<(int, int)> bottomToTop = [(0, -1), (0, -2), (0, -3)];
  List<(int, int)> topLeftBottomRight = [(1, 1), (2, 2), (3, 3)];
  List<(int, int)> bottomRightTopLeft = [(-1, -1), (-2, -2), (-3, -3)];
  List<(int, int)> topRightBottomLeft = [(-1, 1), (-2, 2), (-3, 3)];
  List<(int, int)> bottomLeftTopRight = [(1, -1), (2, -2), (3, -3)];
  List<List<(int, int)>> scans = [
    leftToRight,
    rightToLeft,
    topToBottom,
    bottomToTop,
    topLeftBottomRight,
    bottomRightTopLeft,
    topRightBottomLeft,
    bottomLeftTopRight
  ];

  List<List<String>> map =
      input.split('\n').map((e) => e.split('').toList()).toList();
  List<(int, int)> seen = [];
  int count = 0;

  for (var y = 0; y < map.length; y++) {
    for (var x = 0; x < map[y].length; x++) {
      for (var scan in scans) {
        String slice = map[y][x];
        for (var delta in scan) {
          var (dx, dy) = delta;
          var tx = x + dx;
          var ty = y + dy;

          if (ty < 0 || ty >= map.length || tx < 0 || tx >= map[ty].length) {
            break;
          }

          var col = map[ty];
          slice += col[tx];
        }
        if (slice == 'XMAS' || slice == 'SAMX') {
          count++;
        }
      }
    }
  }

  return count ~/ 2;
}

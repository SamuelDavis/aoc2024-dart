Iterable<Iterable<int>> parseInput(String input) {
  return input
      .trim()
      .split('\n')
      .map((line) => line.split(' ').map((character) => int.parse(character)));
}

int day2Part1(String input) {
  var safe = 0;

  for (var list in parseInput(input)) {
    int? vPrev, dPrev;
    bool isSafe = true;
    for (var vCurr in list) {
      if (vPrev == null) {
        vPrev = vCurr;
        continue;
      }

      var dCurr = vCurr - vPrev;
      dPrev ??= dCurr;

      var dAbs = dCurr.abs();
      isSafe = isSafe &&
          (dAbs >= 1 && dAbs <= 3) &&
          ((dCurr < 0 && dPrev < 0) || (dCurr > 0 && dPrev > 0));
      if (!isSafe) break;

      vPrev = vCurr;
      dPrev = dCurr;
    }
    if (isSafe) safe++;
  }

  return safe;
}

int day2Part2(String input, int tolerance) {
  var safe = 0;

  for (var list in parseInput(input)) {
    int? vPrev, dPrev;
    int attempts = 0;
    for (var vCurr in list) {
      if (attempts > tolerance) break;

      if (vPrev == null) {
        vPrev = vCurr;
        continue;
      }

      final dCurr = vCurr - vPrev;
      final dAbs = dCurr.abs();
      var stepInRange = (dAbs >= 1 && dAbs <= 3);

      if (!stepInRange) {
        attempts++;
        continue;
      }

      if (dPrev == null) {
        vPrev = vCurr;
        dPrev = dCurr;
        continue;
      }

      final consistentDirection =
          (dCurr < 0 && dPrev < 0) || (dCurr > 0 && dPrev > 0);

      if (!consistentDirection) {
        attempts++;
        continue;
      }

      vPrev = vCurr;
      dPrev = dCurr;
    }

    if (attempts <= tolerance) safe++;
  }

  return safe;
}

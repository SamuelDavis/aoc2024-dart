import 'package:aoc2024_dart/day1.dart';
import 'package:aoc2024_dart/day2.dart';
import 'package:aoc2024_dart/day3.dart';
import 'package:aoc2024_dart/day4.dart';
import 'package:args/args.dart';

final commands = <String, Function>{
  'day1Part1': day1Part1,
  'day1Part2': day1Part2,
  'day2Part1': day2Part1,
  'day2Part2': (String input, String tolerance) =>
      day2Part2(input, int.parse(tolerance)),
  'day3Part1': day3Part1,
  'day3Part2': day3Part2,
  'day4Part1': day4Part1,
};

const String version = '0.0.1';

ArgParser buildParser() {
  ArgParser argParser = ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    )
    ..addFlag(
      'version',
      negatable: false,
      help: 'Print the tool version.',
    );

  return argParser;
}

void printUsage(ArgParser argParser) {
  print('Usage: dart aoc2024_dart.dart <flags> [arguments]');
  print(argParser.usage);
  print('Available arguments:');
  for (var command in commands.keys) {
    print('\t$command');
  }
}

void main(List<String> arguments) {
  final ArgParser argParser = buildParser();
  try {
    final ArgResults results = argParser.parse(arguments);

    // Process the parsed arguments.
    if (results.wasParsed('help')) {
      printUsage(argParser);
      return;
    }
    if (results.wasParsed('version')) {
      print('aoc2024_dart version: $version');
      return;
    }

    final command = commands[results.rest.firstOrNull];
    if (command is Function) {
      print(Function.apply(command, results.rest.sublist(1)));
    } else {
      print('Unknown command $command');
      printUsage(argParser);
    }
  } on FormatException catch (e) {
    // Print usage information if an invalid argument was provided.
    print(e.message);
    print('');
    printUsage(argParser);
  }
}

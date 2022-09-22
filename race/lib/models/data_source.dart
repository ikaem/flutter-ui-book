import 'package:race/models/results_entry.dart';
import 'package:race/models/standings_entry.dart';

/// Fake data source for the standings list
const standingsList = [
  StandingsEntry(
    name: 'Test 2',
    countryCode: 'gb-eng',
    points: 56,
  ),
  StandingsEntry(
    name: 'Test 5',
    countryCode: 'us',
    points: 55,
  ),
  StandingsEntry(
    name: 'Test 1',
    countryCode: 'hr',
    points: 48,
  ),
  StandingsEntry(
    name: 'Test 3',
    countryCode: 'hr',
    points: 32,
  ),
  StandingsEntry(
    name: 'Test 6',
    countryCode: 'hr',
    points: 26,
  ),
  StandingsEntry(
    name: 'Test 4',
    countryCode: 'us',
    points: 18,
  ),
];

/// Fake data source for the results list
const resultsList = [
  [
    ResultsEntry(
      name: 'Player 3',
      lastName: 'Test 3',
      countryCode: 'us',
      position: 1,
      circuitName: 'Some name 1',
    ),
    ResultsEntry(
      name: 'Player 1',
      lastName: 'Test 1',
      countryCode: 'hr',
      position: 2,
      circuitName: 'Some name 1',
    ),
    ResultsEntry(
      name: 'Player 4',
      lastName: 'Test 4',
      countryCode: 'us',
      position: 3,
      circuitName: 'Some name 1',
    ),
    ResultsEntry(
      name: 'Player 2',
      lastName: 'Test 2',
      countryCode: 'gb-eng',
      position: 4,
      circuitName: 'Some name 1',
    ),
  ],
  [
    ResultsEntry(
      name: 'Player 1',
      lastName: 'Test 1',
      countryCode: 'us',
      position: 1,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 5',
      lastName: 'Test 5',
      countryCode: 'hr',
      position: 2,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 2',
      lastName: 'Test 2',
      countryCode: 'hr',
      position: 3,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 3',
      lastName: 'Test 3',
      countryCode: 'us',
      position: 4,
      circuitName: 'Some name 2',
    ),
    ResultsEntry(
      name: 'Player 6',
      lastName: 'Test 6',
      countryCode: 'gb-eng',
      position: 5,
      circuitName: 'Some name 2',
    ),
  ],
  [
    ResultsEntry(
      name: 'Player 6',
      lastName: 'Test 1',
      countryCode: 'us',
      position: 1,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 4',
      lastName: 'Test 1',
      countryCode: 'hr',
      position: 2,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 1',
      lastName: 'Test 1',
      countryCode: 'gb-eng',
      position: 3,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 5',
      lastName: 'Test 1',
      countryCode: 'us',
      position: 4,
      circuitName: 'Some name 3',
    ),
    ResultsEntry(
      name: 'Player 2',
      lastName: 'Test 1',
      countryCode: 'us',
      position: 5,
      circuitName: 'Some name 3',
    ),
  ],
  [
    ResultsEntry(
      name: 'Player 2',
      lastName: 'Test 2',
      countryCode: 'hr',
      position: 1,
      circuitName: 'Some name 4',
    ),
    ResultsEntry(
      name: 'Player 4',
      lastName: 'Test 4',
      countryCode: 'hr',
      position: 2,
      circuitName: 'Some name 4',
    ),
    ResultsEntry(
      name: 'Player 3',
      lastName: 'Test 3',
      countryCode: 'hr',
      position: 3,
      circuitName: 'Some name 4',
    ),
  ],
];

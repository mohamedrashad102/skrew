import 'player_manger.dart';

abstract class RoundManger {
  static late String _trace;
  static final List<PlayerManger> _players = [];
  static final List<List<PlayerManger>> _rounds = [];
  static const Map<int, String> _traceMap = {
    5: '4343434',
    6: '44344344',
    7: '444434444',
    8: '4444444444',
  };

  static List<List<int>> generateRounds({
    required List<String> playersNames,
  }) {
    _trace = _traceMap[playersNames.length]!;
    _initPLayers(playersNames);
    _generateRounds();
    List<List<String>> rounds = _rounds
        .map(
          (round) => round
              .map(
                (player) => player.name,
              )
              .toList(),
        )
        .toList();

    List<List<int>> result = List.generate(
      playersNames.length,
      (index) => [],
    );

    for (int roundIndex = 0; roundIndex < rounds.length; roundIndex++) {
      for (int playerIndex = 0;
          playerIndex < playersNames.length;
          playerIndex++) {
        if (rounds[roundIndex].contains(playersNames[playerIndex])) {
          result[playerIndex].add(roundIndex);
        }
      }
    }
    return result;
  }

  static int determineRoundNumbers({required int playersNumber}) {
    return _traceMap[playersNumber]!.length;
  }

  static void _initPLayers(List<String> playersNames) {
    _players
      ..clear()
      ..addAll(List.generate(
        playersNames.length,
        (index) => PlayerManger(
          name: playersNames[index],
          roundsCounter: 0,
        ),
      ));
  }

  static void _sortPlayersCounter() {
    _players.sort(
      (a, b) {
        return a.roundsCounter.compareTo(b.roundsCounter);
      },
    );
  }

  static void _generateRounds() {
    _rounds.clear();
    for (int i = 0; i < _trace.length; i++) {
      int numberOfRoundPlayers = int.parse(_trace[i]);
      List<PlayerManger> roundPlayers = [];
      _players.shuffle();
      _sortPlayersCounter();
      for (int i = 0; i < numberOfRoundPlayers; i++) {
        _players[i].roundsCounter++;
        roundPlayers.add(_players[i]);
      }
      _rounds.add(roundPlayers);
    }
  }
}

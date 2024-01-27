class Player {
  String name;
  int roundsCounter = 5;
  List<int?> roundsScores;
  int totalScore = 0;

  Player({
    required this.name,
    required this.roundsScores,
  });
}

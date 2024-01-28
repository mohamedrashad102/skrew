class Player {
  String name;
  List<int?> roundsScores;
  List<bool> roundsStates; // player will play in this round if true
  int totalScore = 0;

  Player({
    required this.name,
    required this.roundsScores,
    required this.roundsStates,
  });
}

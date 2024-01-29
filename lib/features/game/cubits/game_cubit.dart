import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/common/models/player.dart';

import '../mangers/game_manger.dart';
import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitialState());
  static GameCubit of(BuildContext context) =>
      BlocProvider.of<GameCubit>(context);

  late int roundsNumber;
  late bool isSpecialGame;
  int? currentRoundIndex = 0;
  final List<Player> players = [];
  final List<bool> currentRoundPlayers = [];
  final List<List<FocusNode>> playersScoresNodes = [];
  final List<TextEditingController> totalScoresControllers = [];
  final List<List<TextEditingController>> playersScoresControllers = [];

  void initializePlayers({
    required int playersNumber,
    required List<String> playersNames,
  }) {
    isSpecialGame = playersNumber > 4;
    if (isSpecialGame) {
      _initSpecialPlayers(playersNames);
    } else {
      _initNormalPlayers(playersNames);
    }
    _initPlayersScoresNodes(playersNumber);
    _initPlayersScoresControllers(playersNumber);
    _initTotalScoresControllers(playersNumber);
    emit(GameSuccessState());
  }

  void reGame() {
    final playersNames = players.map((player) => player.name).toList();
    if (isSpecialGame) {
      _initSpecialPlayers(playersNames);
    } else {
      _initNormalPlayers(playersNames);
    }
    _clearPlayersScores();
    _clearScoresControllers();
    emit(GameSuccessState());
  }

  void disposePlayersControllers() {
    totalScoresControllers.clear();
    playersScoresControllers.clear();
  }

  void disposePlayersNodes() {
    playersScoresNodes.clear();
  }

  void changePlayerName({
    required String playerName,
    required int playerIndex,
  }) {
    players[playerIndex].name = playerName;
    emit(GameSuccessState());
  }

  void changePlayerScore({
    required String? score,
    required int roundIndex,
    required int playerIndex,
  }) {
    currentRoundIndex = roundIndex;
    players[playerIndex].roundsScores[roundIndex] =
        score == null || score.isEmpty ? null : int.tryParse(score);
    playersScoresControllers[playerIndex][roundIndex].text =
        score == null || score.isEmpty ? '' : int.parse(score).toString();
    final String totalScore =
        _getTotalScore(playerIndex: playerIndex).toString();
    totalScoresControllers[playerIndex].text = totalScore;
    emit(GameSuccessState());
  }

  void toNextNode({
    required BuildContext context,
    required int playerIndex,
    required int roundIndex,
  }) {
    int nextPlayerIndex = playerIndex - 1;
    while (nextPlayerIndex >= 0 &&
        players[nextPlayerIndex].roundsStates[roundIndex] == false) {
      nextPlayerIndex--;
    }
    if (nextPlayerIndex >= 0) {
      final nextNode = playersScoresNodes[nextPlayerIndex][roundIndex];
      FocusScope.of(context).requestFocus(nextNode);
    } else {
      if (currentRoundIndex! + 1 < roundsNumber) {
        currentRoundIndex = currentRoundIndex! + 1;
      } else {
        currentRoundIndex = null;
      }
      FocusScope.of(context).unfocus();
    }
    emit(GameSuccessState());
  }

  void selectRound({
    required int? roundIndex,
  }) {
    currentRoundIndex = roundIndex;
    emit(GameSuccessState());
  }


  bool isWinner({required int playerIndex}) {
    final winners = _getWinnersIndexes();
    return winners.contains(playerIndex);
  }

  int _getTotalScore({required int playerIndex}) {
    int totalScore = 0;
    for (var round in players[playerIndex].roundsScores) {
      int score = round ?? 0;
      totalScore += score;
    }
    return totalScore;
  }

  List<int> _getWinnersIndexes() {
    int minScore = _getTotalScore(playerIndex: 0);
    List<int> winnersIndexes = [];
    for (int i = 0; i < players.length; i++) {
      minScore = min(minScore, _getTotalScore(playerIndex: i));
    }
    for (int i = 0; i < players.length; i++) {
      if (minScore == _getTotalScore(playerIndex: i)) {
        winnersIndexes.add(i);
      }
    }
    return winnersIndexes;
  }

  void _clearScoresControllers() {
    for (int i = 0; i < playersScoresControllers.length; i++) {
      for (int j = 0; j < roundsNumber; j++) {
        playersScoresControllers[i][j].clear();
      }
      totalScoresControllers[i].text = '0';
    }
  }

  void _clearPlayersScores() {
    for (int i = 0; i < players.length; i++) {
      for (int j = 0; j < roundsNumber; j++) {
        players[i].roundsScores[j] = null;
      }
    }
  }

  void _initTotalScoresControllers(int playersNumber) {
    totalScoresControllers
      ..clear()
      ..addAll(
        List.generate(
          playersNumber,
          (_) => TextEditingController(text: '0'),
        ),
      );
  }

  void _initPlayersScoresNodes(int playersNumber) {
    playersScoresNodes
      ..clear()
      ..addAll(
        List.generate(
          playersNumber,
          (index) => List.generate(
            roundsNumber,
            (index) => FocusNode(),
          ),
        ),
      );
  }

  void _initPlayersScoresControllers(int playersNumber) {
    playersScoresControllers
      ..clear()
      ..addAll(
        List.generate(
          playersNumber,
          (index) => List.generate(
            roundsNumber,
            (index) => TextEditingController(),
          ),
        ),
      );
  }

  void _initNormalPlayers(List<String> playersNames) {
    roundsNumber = 5;
    players
      ..clear()
      ..addAll(
        List.generate(
          playersNames.length,
          (index) => Player(
            name: playersNames[index],
            roundsStates: List.filled(
              roundsNumber,
              true,
            ),
            roundsScores: List.filled(
              roundsNumber,
              null,
            ),
          ),
        ),
      );
  }

  void _initSpecialPlayers(List<String> playersNames) {
    final result = RoundManger.generateRounds(playersNames: playersNames);
    roundsNumber =
        RoundManger.determineRoundNumbers(playersNumber: playersNames.length);

    players
      ..clear()
      ..addAll(
        List.generate(
          playersNames.length,
          (playerIndex) => Player(
            name: playersNames[playerIndex],
            roundsStates: List.generate(
              roundsNumber,
              (roundIndex) => result[playerIndex].contains(roundIndex),
            ),
            roundsScores: List.filled(
              roundsNumber,
              null,
            ),
          ),
        ),
      );
  }
}

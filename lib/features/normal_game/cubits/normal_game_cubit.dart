import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/common/models/player.dart';
import 'package:skrew/features/normal_game/mangers/game_manger.dart';

import 'normal_game_state.dart';

class NormalGameCubit extends Cubit<NormalGameState> {
  NormalGameCubit() : super(NormalGameInitialState());
  static NormalGameCubit of(BuildContext context) =>
      BlocProvider.of<NormalGameCubit>(context);

  late int roundsNumber;
  final List<Player> players = [];
  late bool isSpecialGame;
  final List<List<TextEditingController>> playersScoresControllers = [];
  final List<TextEditingController> totalScoresControllers = [];

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
    _initPlayersScoresControllers(playersNumber);
    _initTotalScoresControllers(playersNumber);
    emit(NormalGameSuccessState());
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
    emit(NormalGameSuccessState());
  }

  void disposePlayersControllers() {
    totalScoresControllers.clear();
    playersScoresControllers.clear();
  }

  void changePlayerName({
    required String playerName,
    required int playerIndex,
  }) {
    players[playerIndex].name = playerName;
    emit(NormalGameSuccessState());
  }

  void changePlayerScore({
    required String? score,
    required int roundIndex,
    required int playerIndex,
  }) {
    players[playerIndex].roundsScores[roundIndex] =
        score == null || score.isEmpty ? null : int.tryParse(score);
    playersScoresControllers[playerIndex][roundIndex].text =
        score == null || score.isEmpty ? '' : int.parse(score).toString();
    final String totalScore =
        _getTotalScore(playerIndex: playerIndex).toString();
    totalScoresControllers[playerIndex].text = totalScore;
    emit(NormalGameSuccessState());
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

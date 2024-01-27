import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'normal_game_state.dart';

class NormalGameCubit extends Cubit<NormalGameState> {
  NormalGameCubit() : super(NormalGameInitialState());
  final List<TextEditingController> playersNames = [];
  final List<List<TextEditingController>> playersScores = [];
  late int numberOfPlayers;
  static NormalGameCubit of(BuildContext context) =>
      BlocProvider.of<NormalGameCubit>(context);

  void generatePlayers({required int playersNumber}) {
    numberOfPlayers = playersNumber;
    _initializePLayersName(playersNumber);
    _initializePlayersScores(playersNumber);
  }

  void createNewGame() {
    _initializePlayersScores(numberOfPlayers);
    emit(NormalGameInitialState());
  }

  void changePlayerName({
    required String name,
    required int playerIndex,
  }) {
    emit(NormalGameChangePlayerNameState());
  }

  void changePlayerScore({
    required int? score,
    required int roundIndex,
    required int playerIndex,
  }) {
    emit(NormalGameChangePlayerScoreState());
  }

  int getTotalScore({required int playerIndex}) {
    int totalScore = 0;
    for (var round in playersScores[playerIndex]) {
      int score = round.text.isEmpty ? 0 : int.parse(round.text);
      totalScore += score;
    }
    return totalScore;
  }

  List<int> getWinnersIndexes() {
    int maxScore = getTotalScore(playerIndex: 0);
    List<int> winnersIndexes = [];
    for (int i = 0; i < playersNames.length; i++) {
      maxScore = min(maxScore, getTotalScore(playerIndex: i));
    }
    for (int i = 0; i < playersNames.length; i++) {
      if (maxScore == getTotalScore(playerIndex: i)) {
        winnersIndexes.add(i);
      }
    }
    return winnersIndexes;
  }

  void _initializePlayersScores(int numberOfPlayers) {
    playersScores.clear();
    final newPlayersScores = List.generate(
      numberOfPlayers,
      (index) => List.generate(
        5,
        (_) => TextEditingController(),
      ),
    );
    playersScores.addAll(newPlayersScores);
  }

  void _initializePLayersName(int numberOfPlayers) {
    playersNames.clear();
    final newPlayersName = List.generate(
      numberOfPlayers,
      (_) => TextEditingController(),
    );
    playersNames.addAll(newPlayersName);
  }
}

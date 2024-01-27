import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/features/home/cubits/players_name_state.dart';

class PlayersNameCubit extends Cubit<PlayersNamesState> {
  PlayersNameCubit() : super(PlayerNamesInitialState());

  static PlayersNameCubit of(BuildContext context) =>
      BlocProvider.of<PlayersNameCubit>(context);
  static const List<String> numbersInArabic = [
    'الأول',
    'الثاني',
    'الثالث',
    'الرابع',
    'الخامس',
    'السادس',
    'السابع',
    'الثامن',
  ];
  final List<String> playersNames = [];
  final List<FocusNode> focusNodes = [];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  initializePlayersNames({required int playersNumber}) {
    playersNames
      ..clear()
      ..addAll(
        List.generate(playersNumber, (_) => ''),
      );
    focusNodes
      ..clear()
      ..addAll(
        List.generate(playersNumber, (_) => FocusNode()),
      );
    emit(PlayersNamesSuccessState());
  }

  disposeFocusNodes() {
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].dispose();
    }
  }

  editPlayerName({
    required int playerIndex,
    required String playerName,
  }) {
    playersNames[playerIndex] = playerName;
    emit(PlayersNamesSuccessState());
  }
}

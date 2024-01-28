import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'players_number_state.dart';

class PlayersNumberCubit extends Cubit<PlayersNumberState> {
  PlayersNumberCubit() : super(PlayersNumberInitialState());

  static PlayersNumberCubit of(BuildContext context) =>
      BlocProvider.of<PlayersNumberCubit>(context);
  static const List<String> options = [
    'لاعبين اثنين',
    'ثلاثة لاعبين',
    'أربعة لاعبين',
    'خمسة لاعبين',
    'ستة لاعبين',
    'سبعة لاعبين',
    'ثمانية لاعبين',
  ];

  int playersNumber = 2;
  int currentOptionIndex = 0;

  selectOption({required int optionIndex}) {
    currentOptionIndex = optionIndex;
    playersNumber = currentOptionIndex + 2;
    emit(PlayersNumberSuccessState());
  }

  bool isNormalGame() {
    return playersNumber <= 4;
  }
}

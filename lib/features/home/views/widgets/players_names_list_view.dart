import 'package:flutter/material.dart';
import 'package:skrew/features/home/cubits/players_number_cubit.dart';

import '../../cubits/players_name_cubit.dart';
import 'player_names_text_form.dart';

class PlayersNamesListView extends StatelessWidget {
  const PlayersNamesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: PlayersNameCubit.of(context).formKey,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Align(
            child: PlayerNameTextForm(
              hintText: _getHintText(playerIndex: index),
              labelText: _getLabelText(playerIndex: index),
              focusNode: PlayersNameCubit.of(context).focusNodes[index],
              onEditingComplete: () {
                if (index == PlayersNumberCubit.of(context).playersNumber - 1) {
                  FocusScope.of(context).unfocus();
                } else {
                  FocusScope.of(context).requestFocus(
                      PlayersNameCubit.of(context).focusNodes[index + 1]);
                }
              },
              onChange: (value) => _changePlayerName(
                context: context,
                playerIndex: index,
                playerName: value,
              ),
              validator: (value) => _validatePlayerName(
                value: value,
                context: context,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 30);
        },
        itemCount: PlayersNumberCubit.of(context).playersNumber,
      ),
    );
  }

  String? _validatePlayerName({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'يجب ادخال اسم اولا';
    }
    int nameFre = 0;
    final playersNames = PlayersNameCubit.of(context).playersNames;
    for (int i = 0; i < playersNames.length; i++) {
      if (playersNames[i] == value) nameFre++;
    }
    if (nameFre > 1) {
      return 'هذا الاسم مكرر';
    }
    return null;
  }

  void _changePlayerName({
    required BuildContext context,
    required int playerIndex,
    required String playerName,
  }) {
    PlayersNameCubit.of(context).editPlayerName(
      playerIndex: playerIndex,
      playerName: playerName,
    );
  }

  String _getHintText({required int playerIndex}) {
    return 'ادخل اسم اللاعب ${PlayersNameCubit.numbersInArabic[playerIndex]}';
  }

  String _getLabelText({required int playerIndex}) {
    return 'اللاعب ${PlayersNameCubit.numbersInArabic[playerIndex]}';
  }
}

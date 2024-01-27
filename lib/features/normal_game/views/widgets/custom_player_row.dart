import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/common/models/table_item_model.dart';
import 'package:skrew/common/utils/coloors.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_cubit.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_state.dart';
import 'package:skrew/features/normal_game/views/widgets/custom_table_row.dart';

class CustomPlayerRow extends StatelessWidget {
  const CustomPlayerRow({
    super.key,
    this.isLast = false,
    required this.playerIndex,
  });
  final int playerIndex;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NormalGameCubit, NormalGameState>(
      builder: (context, state) {
        final cubit = NormalGameCubit.of(context);
        final winnersIndexes = cubit.getWinnersIndexes();
        final String totalScore =
            cubit.getTotalScore(playerIndex: playerIndex).toString();
        return CustomTableRow(
          isLast: isLast,
          tableItems: [
            // total score
            TableItemModel(
              enable: false,
              controller: TextEditingController(text: totalScore),
              color: isWinner(winnersIndexes)
                  ? Coloors.darkGreen
                  : Coloors.scoreItemColor,
            ),
            // rounds scores
            ...cubit.playersScores[playerIndex].asMap().entries.map(
              (entire) {
                int roundIndex = 4 - entire.key;
                return TableItemModel(
                  controller: cubit.playersScores[playerIndex][roundIndex],
                  color:
                      cubit.playersScores[playerIndex][roundIndex].text == '0'
                          ? Coloors.darkGreen
                          : Coloors.scoreItemColor,
                  onChange: (value) {
                    cubit.changePlayerScore(
                      score: value.isEmpty ? null : int.parse(value),
                      roundIndex: roundIndex,
                      playerIndex: playerIndex,
                    );
                  },
                );
              },
            ),
            // player name
            TableItemModel(
              controller: cubit.playersNames[playerIndex],
              color: Coloors.nameItemColor,
              onlyNumbers: false,
              onChange: (value) {
                cubit.changePlayerName(
                  name: value,
                  playerIndex: playerIndex,
                );
              },
            ),
          ],
        );
      },
    );
  }

  bool isWinner(List<int> winnersIndexes) =>
      winnersIndexes.contains(playerIndex);
}

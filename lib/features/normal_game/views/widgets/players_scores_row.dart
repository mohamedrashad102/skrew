import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/coloors.dart';
import '../../cubit/normal_game_cubit.dart';
import '../../cubit/normal_game_state.dart';
import 'custom_table_item.dart';
import 'custom_table_row.dart';

class PlayersScoresRow extends StatelessWidget {
  const PlayersScoresRow({
    super.key,
    required this.roundIndex,
  });
  final int roundIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NormalGameCubit, NormalGameState>(
      builder: (context, state) {
        final cubit = NormalGameCubit.of(context);
        return CustomTableRow(
          children: [
            ...cubit.players.asMap().entries.map(
                  (entry) => Expanded(
                    child: CustomTableItem(
                      color:
                          cubit.players[entry.key].roundsScores[roundIndex] == 0
                              ? Coloors.darkGreen
                              : Coloors.scoreItemColor,
                      controller: cubit.playersScoresControllers[entry.key]
                          [roundIndex],
                      onlyNumbers: true,
                      onChange: (value) => cubit.changePlayerScore(
                        score: value,
                        roundIndex: roundIndex,
                        playerIndex: entry.key,
                      ),
                    ),
                  ),
                ),
            Expanded(
              child: CustomTableItem(
                color: Coloors.darkGray,
                isRight: true,
                enable: false,
                initialValue:
                    'الجوله ${NormalGameCubit.numbersInArabic[roundIndex]}',
              ),
            ),
          ],
        );
      },
    );
  }
}

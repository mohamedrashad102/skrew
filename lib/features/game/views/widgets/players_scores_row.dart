import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/constants/random.dart';
import '../../../../common/utils/coloors.dart';
import '../../../../common/widgets/custom_table_item.dart';
import '../../cubits/game_cubit.dart';
import '../../cubits/game_state.dart';

class PlayersScoresRow extends StatelessWidget {
  const PlayersScoresRow({
    super.key,
    required this.roundIndex,
  });
  final int roundIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final cubit = GameCubit.of(context);
        return Row(
          children: [
            ...cubit.players.asMap().entries.map(
              (entry) {
                final playerIndex = entry.key;
                final player = entry.value;
                return CustomTableItem(
                  color: !player.roundsStates[roundIndex]
                      ? Coloors.darkGray
                      : player.roundsScores[roundIndex] == 0
                          ? Coloors.darkGreen
                          : Coloors.scoreItemColor,
                  controller: cubit.playersScoresControllers[playerIndex]
                      [roundIndex],
                  onlyNumbers: true,
                  onChange: (value) => cubit.changePlayerScore(
                    score: value,
                    roundIndex: roundIndex,
                    playerIndex: playerIndex,
                  ),
                  enable: player.roundsStates[roundIndex],
                );
              },
            ),
            CustomTableItem(
              color: Coloors.lightBlue,
              isRight: true,
              enable: false,
              initialValue: 'الجوله ${roundsNumbersInArabic[roundIndex]}',
            ),
          ],
        );
      },
    );
  }
}

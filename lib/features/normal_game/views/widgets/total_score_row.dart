import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/coloors.dart';
import '../../../../common/widgets/custom_table_item.dart';
import '../../cubits/normal_game_cubit.dart';
import '../../cubits/normal_game_state.dart';

class TotalScoreRow extends StatelessWidget {
  const TotalScoreRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NormalGameCubit, NormalGameState>(
      builder: (context, state) {
        final cubit = NormalGameCubit.of(context);
        return Row(
          children: [
            ...cubit.players.asMap().entries.map(
              (entry) {
                final playerIndex = entry.key;
                return CustomTableItem(
                  color: cubit.isWinner(playerIndex: playerIndex)
                      ? Coloors.darkGreen
                      : Coloors.scoreItemColor,
                  isLast: true,
                  enable: false,
                  controller: cubit.totalScoresControllers[playerIndex],
                );
              },
            ),
            CustomTableItem(
              color: Coloors.lightOrange,
              textColor: Colors.black,
              initialValue: 'المجموع',
              isRight: true,
              isLast: true,
              enable: false,
              
            ),
          ],
        );
      },
    );
  }
}

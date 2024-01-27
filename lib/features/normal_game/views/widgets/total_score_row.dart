import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/coloors.dart';
import '../../cubit/normal_game_cubit.dart';
import '../../cubit/normal_game_state.dart';
import 'custom_table_item.dart';
import 'custom_table_row.dart';

class TotalScoreRow extends StatelessWidget {
  const TotalScoreRow({super.key});

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
                      color: cubit.isWinner(playerIndex: entry.key) 
                          ? Coloors.darkGreen
                          : Coloors.scoreItemColor,
                      isLast: true,
                      enable: false,
                      controller: cubit.totalScoresControllers[entry.key],
                    ),
                  ),
                ),
            Expanded(
              child: CustomTableItem(
                color: Coloors.darkGray,
                initialValue: 'المجموع',
                isRight: true,
                isLast: true,
                enable: false,
              ),
            ),
          ],
        );
      },
    );
  }
}

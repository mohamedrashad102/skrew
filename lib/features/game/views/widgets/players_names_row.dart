import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/coloors.dart';
import '../../../../common/widgets/custom_table_item.dart';
import '../../cubits/game_cubit.dart';
import '../../cubits/game_state.dart';

class PlayersNamesRow extends StatelessWidget {
  const PlayersNamesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final cubit = GameCubit.of(context);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...cubit.players.map(
              (player) => Column(
                children: [
                  Visibility(
                    visible: cubit.isSpecialGame &&
                        cubit.currentRoundIndex != null &&
                        player.roundsStates[cubit.currentRoundIndex!],
                    child: const Icon(
                      Icons.arrow_downward,
                    ),
                  ),
                  CustomTableItem(
                    color: Coloors.nameItemColor,
                    initialValue: player.name,
                  ),
                ],
              ),
            ),
            CustomTableItem(
              color: Coloors.lightOrange,
              isRight: true,
              enable: false,
            ),
          ],
        );
      },
    );
  }
}

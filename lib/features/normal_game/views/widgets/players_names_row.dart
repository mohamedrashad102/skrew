import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/coloors.dart';
import '../../cubit/normal_game_cubit.dart';
import '../../cubit/normal_game_state.dart';
import 'custom_table_item.dart';
import 'custom_table_row.dart';

class PlayersNamesRow extends StatelessWidget {
  const PlayersNamesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NormalGameCubit, NormalGameState>(
      builder: (context, state) {
        final cubit = NormalGameCubit.of(context);
        return CustomTableRow(
          children: [
            ...cubit.players.map(
              (player) => Expanded(
                child: CustomTableItem(
                  color: Coloors.nameItemColor,
                  initialValue: player.name,
                ),
              ),
            ),
            Expanded(
              child: CustomTableItem(
                color: Coloors.darkGray,
                isRight: true,
                enable: false,
              ),
            ),
          ],
        );
      },
    );
  }
}

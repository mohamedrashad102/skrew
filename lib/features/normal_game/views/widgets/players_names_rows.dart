import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/normal_game_cubit.dart';
import '../../cubit/normal_game_state.dart';
import 'players_scores_row.dart';

class PlayersScoresRows extends StatelessWidget {
  const PlayersScoresRows({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NormalGameCubit, NormalGameState>(
      builder: (context, state) {
        return Column(
          children: NormalGameCubit.of(context)
              .players
              .asMap()
              .entries
              .map(
                (entry) => PlayersScoresRow(roundIndex: entry.key),
              )
              .toList(),
        );
      },
    );
  }
}

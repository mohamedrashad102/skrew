import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/game_cubit.dart';
import '../../cubits/game_state.dart';
import 'players_scores_row.dart';

class PlayersScoresRows extends StatelessWidget {
  const PlayersScoresRows({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return Column(
          children: List.generate(
            GameCubit.of(context).roundsNumber,
            (index) => PlayersScoresRow(roundIndex: index),
          ),
        );
      },
    );
  }
}

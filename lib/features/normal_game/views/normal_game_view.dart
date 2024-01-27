import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skrew/common/utils/coloors.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_cubit.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_state.dart';
import 'package:zoom_widget/zoom_widget.dart';

import 'widgets/new_game_button.dart';
import 'widgets/players_names_row.dart';
import 'widgets/players_names_rows.dart';
import 'widgets/total_score_row.dart';

class NormalGameView extends StatefulWidget {
  const NormalGameView({super.key});

  @override
  State<NormalGameView> createState() => _NormalGameViewState();
}

class _NormalGameViewState extends State<NormalGameView> {
  @override
  void dispose() {
    NormalGameCubit.of(context).disposePlayersControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Zoom(
          enableScroll: false,
          centerOnScale: true,
          initTotalZoomOut: true,
          backgroundColor: Coloors.scaffoldBgColor,
          canvasColor: Coloors.scaffoldBgColor,
          child: Container(
            color: Coloors.scaffoldBgColor,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: BlocBuilder<NormalGameCubit, NormalGameState>(
              builder: (context, state) {
                return const Column(
                  children: [
                    PlayersNamesRow(),
                    PlayersScoresRows(),
                    TotalScoreRow(),
                    Gap(20),
                    NewGameButton(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

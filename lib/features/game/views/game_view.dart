import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skrew/common/utils/coloors.dart';
import 'package:skrew/common/widgets/show_alert_dialog.dart';
import 'package:skrew/features/game/cubits/game_cubit.dart';
import 'package:skrew/features/game/cubits/game_state.dart';
import 'package:skrew/features/game/views/widgets/new_game_button.dart';
import 'package:zoom_widget/zoom_widget.dart';

import 'widgets/players_names_row.dart';
import 'widgets/players_scores_rows.dart';
import 'widgets/total_score_row.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showAlertDialog(context,
            content: const Text('هل انت  متأكد من الخروج؟'),
            acceptTitle: 'نعم', onAccept: () {
          Navigator.pop(context); // player names view
          Navigator.pop(context); // player numbers view
        });
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              return Zoom(
                enableScroll: false,
                centerOnScale: true,
                initTotalZoomOut: true,
                backgroundColor: Coloors.scaffoldBgColor,
                canvasColor: Coloors.scaffoldBgColor,
                child: Container(
                  color: Coloors.scaffoldBgColor,
                  margin: EdgeInsets.only(
                      left: GameCubit.of(context).isSpecialGame ? 20 : 0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PlayersNamesRow(),
                      PlayersScoresRows(),
                      TotalScoreRow(),
                      Gap(20),
                      NewGameButton(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

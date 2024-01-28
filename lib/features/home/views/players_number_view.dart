import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/common/widgets/custom_text_button.dart';
import 'package:skrew/features/home/cubits/players_name_cubit.dart';
import 'package:skrew/features/home/cubits/players_number_cubit.dart';
import 'package:skrew/features/home/views/widgets/options_list_view.dart';

import 'widgets/choose_players_number_text.dart';

class PlayersNumberView extends StatelessWidget {
  const PlayersNumberView({
    super.key,
  });

  static int numberOfPlayers = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ChoosePlayersNumberText(),
            const Gap(10),
            const OptionsListView(),
            const Gap(10),
            CustomTextButton(
              onTap: () => _navigateToPlayersNamesView(context),
              data: 'التالي',
            ),
          ],
        ),
      ),
    );
  }

  _navigateToPlayersNamesView(BuildContext context) {
    final playersNumber = PlayersNumberCubit.of(context).playersNumber;
    PlayersNameCubit.of(context)
        .initializePlayersNames(playersNumber: playersNumber);
    context.push(AppRoutes.playersNames);
  }
}

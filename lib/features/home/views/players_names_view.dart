import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/common/widgets/custom_button.dart';
import 'package:skrew/features/home/cubit/players_name_cubit.dart';
import 'package:skrew/features/home/cubit/players_number_cubit.dart';
import 'package:skrew/features/home/views/widgets/players_names_list_view.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_cubit.dart';

class PlayersNamesView extends StatelessWidget {
  const PlayersNamesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: PlayersNamesListView(),
                ),
                const Gap(20),
                CustomButton(
                  onTap: () => _start(context),
                  data: 'بدأ',
                ),
                const Gap(30)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _start(BuildContext context) {
    if (PlayersNameCubit.of(context).formKey.currentState!.validate()) {
      NormalGameCubit.of(context).generatePlayers(
        playersNumber: PlayersNumberCubit.of(context).playersNumber,
      );
      context.push(AppRoutes.normalGame);
    }
  }
}

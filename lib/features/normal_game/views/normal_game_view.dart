import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skrew/common/models/table_item_model.dart';
import 'package:skrew/common/utils/coloors.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_cubit.dart';
import 'package:skrew/features/normal_game/cubit/normal_game_state.dart';
import 'package:skrew/features/normal_game/views/widgets/custom_players_widget.dart';
import 'package:skrew/features/normal_game/views/widgets/custom_table_row.dart';
import 'package:zoom_widget/zoom_widget.dart';

import 'widgets/new_game_button.dart';

class NormalGameView extends StatelessWidget {
  const NormalGameView({super.key});

  static const List<String> roundsTitles = [
    '5',
    '4',
    '3',
    '2',
    '1',
  ];
  static final List<TableItemModel> headers = [
    TableItemModel(
      enable: false,
      onlyNumbers: true,
      initialValue: 'total',
      fontSize: 14,
      color: Coloors.darkGray,
    ),
    ...roundsTitles.map(
      (roundTitle) => TableItemModel(
        color: Coloors.lightBlue,
        initialValue: 'round $roundTitle',
        fontSize: 14,
        enable: false,
        onlyNumbers: true,
      ),
    ),
    TableItemModel(
      enable: false,
      onlyNumbers: false,
      fontSize: 15,
      initialValue: 'الأسماء / الجولات',
      color: Coloors.darkGray,
    ),
  ];

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
                return Column(
                  children: [
                    CustomTableRow(tableItems: headers),
                    const CustomPlayersWidget(),
                    const Gap(20),
                    const NewGameButton(),
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

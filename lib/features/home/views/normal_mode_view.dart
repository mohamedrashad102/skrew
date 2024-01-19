import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/common/widgets/custom_button.dart';
import 'package:skrew/features/home/views/widgets/options_list.dart';

import 'widgets/choose_number_of_players.dart';

class NormalModeView extends StatelessWidget {
  const NormalModeView({
    super.key,
  });

  static const List<String> options = [
    'لاعبين اثنين',
    'ثلاثة لاعبين',
    'أربعة لاعبين',
    'خمسة لاعبين',
    'ستة لاعبين',
  ];
  static int numberOfPlayers = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('سكرو عاديه'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ChooseNumberOfPlayers(),
            const Gap(10),
            OptionsList(
              options: options,
              onSelect: _onSelect,
            ),
            const Gap(10),
            CustomButton(
              onTap: () => _start(context),
              data: 'بدأ',
            ),
          ],
        ),
      ),
    );
  }

  _onSelect(int index) {
    numberOfPlayers = index + 2;
  }

  _start(BuildContext context) {
    context.push(AppRoutes.normalGame, extra: numberOfPlayers);
  }
}

import 'package:flutter/material.dart';

import '../../../../common/constants/random.dart';
import '../../../../common/widgets/custom_text_button.dart';
import '../../../../common/widgets/show_alert_dialog.dart';
import '../../cubits/game_cubit.dart';

class NewGameButton extends StatelessWidget {
  const NewGameButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tableItemWidth * (1 + GameCubit.of(context).players.length),
      child: Align(
        child: CustomTextButton(
          onTap: () => showAlertDialog(
            context,
            content: const Text('هل انت متأكد من انشاء جيم جديد'),
            acceptTitle: 'نعم',
            onAccept: () {
              GameCubit.of(context).reGame();
            },
          ),
          data: 'جيم جديد',
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/show_alert_dialog.dart';
import '../../cubit/normal_game_cubit.dart';

class NewGameButton extends StatelessWidget {
  const NewGameButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onTap: () => showAlertDialog(
        context,
        content: const Text('هل انت متأكد من انشاء جيم جديد'),
        acceptTitle: 'نعم',
        onAccept: () {
          NormalGameCubit.of(context).createNewGame();
        },
      ),
      data: 'جيم جديد',
    );
  }
}

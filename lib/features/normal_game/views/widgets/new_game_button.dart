import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_text_button.dart';
import '../../../../common/widgets/show_alert_dialog.dart';
import '../../cubits/normal_game_cubit.dart';

class NewGameButton extends StatelessWidget {
  const NewGameButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onTap: () => showAlertDialog(
        context,
        content: const Text('هل انت متأكد من انشاء جيم جديد'),
        acceptTitle: 'نعم',
        onAccept: () {
          NormalGameCubit.of(context).reGame();
        },
      ),
      data: 'جيم جديد',
    );
  }
}

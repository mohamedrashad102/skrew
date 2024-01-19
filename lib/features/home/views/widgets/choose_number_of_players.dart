import 'package:flutter/material.dart';

import '../../../../common/utils/coloors.dart';

class ChooseNumberOfPlayers extends StatelessWidget {
  const ChooseNumberOfPlayers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'اختر عدد اللاعبين',
      style: TextStyle(
        color: Coloors.textColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

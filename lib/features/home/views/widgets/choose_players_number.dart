import 'package:flutter/material.dart';

class ChoosePlayersNumber extends StatelessWidget {
  const ChoosePlayersNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'اختر عدد اللاعبين',
      style: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

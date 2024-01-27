import 'package:flutter/material.dart';

class ChoosePlayersNumberText extends StatelessWidget {
  const ChoosePlayersNumberText({
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

import 'package:flutter/material.dart';

import 'widgets/names_rounds_widget.dart';

class NormalGameView extends StatelessWidget {
  const NormalGameView({
    super.key,
    required this.numberOfPlayers,
  });
  final int numberOfPlayers;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: NamesRoundsWidget(),
      ),
    );
  }
}

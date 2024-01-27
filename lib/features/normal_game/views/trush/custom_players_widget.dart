// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skrew/features/normal_game/cubit/normal_game_cubit.dart';
// import 'package:skrew/features/normal_game/cubit/normal_game_state.dart';

// class CustomPlayersWidget extends StatelessWidget {
//   const CustomPlayersWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NormalGameCubit, NormalGameState>(
//       builder: (context, state) {
//         final cubit = NormalGameCubit.of(context);
//         return const Column(
//             // children: List.generate(
//             //   cubit.numberOfPlayers,
//             //   (index) => CustomPlayerRow(
//             //     playerIndex: index,
//             //     isLast: index == cubit.numberOfPlayers - 1,
//             //   ),
//             // ),
//             );
//       },
//     );
//   }
// }

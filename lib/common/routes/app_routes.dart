import 'package:go_router/go_router.dart';
import 'package:skrew/features/home/views/players_names_view.dart';
import 'package:skrew/features/normal_game/views/normal_game_view.dart';
import 'package:skrew/features/special_game/views/special_game_view.dart';
import 'package:skrew/features/splash/splash_view.dart';

import '../../features/home/views/players_number_view.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String playersNumber = '/playersNumber';
  static const String playersNames = '/playersNames';
  static const String normalGame = '/normalGame';
  static const String specialGame = '/specialGame';

  static final route = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: playersNumber,
        builder: (context, state) => const PlayersNumberView(),
      ),
      GoRoute(
        path: playersNames,
        builder: (context, state) => const PlayersNamesView(),
      ),
      GoRoute(
        path: normalGame,
        builder: (context, state) => const NormalGameView(),
      ),
      GoRoute(
        path: specialGame,
        builder: (context, state) => const SpecialGameView(),
      ),
    ],
  );
}

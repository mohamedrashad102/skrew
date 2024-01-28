import 'package:go_router/go_router.dart';
import 'package:skrew/features/home/views/players_names_view.dart';
import 'package:skrew/features/splash/splash_view.dart';

import '../../features/home/views/players_number_view.dart';
import '../../features/game/views/game_view.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String playersNumber = '/playersNumber';
  static const String playersNames = '/playersNames';
  static const String game = '/game';
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
        path: game,
        builder: (context, state) => const GameView(),
      ),
    ],
  );
}

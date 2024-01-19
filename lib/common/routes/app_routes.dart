import 'package:go_router/go_router.dart';
import 'package:skrew/features/competition_game/views/competition_view/competition_game_view.dart';
import 'package:skrew/features/home/views/competition_mode_view.dart';
import 'package:skrew/features/home/views/home_view.dart';
import 'package:skrew/features/home/views/normal_mode_view.dart';
import 'package:skrew/features/normal_game/views/normal_game_view.dart';
import 'package:skrew/features/splash/splash_view.dart';

import '../../features/competition_game/views/result_view/result_view.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String normalMode = '/normalMode';
  static const String competitionMode = '/competitionMode';
  static const String competitionGame = '/competitionGame';
  static const String normalGame = '/normalGame';
  static const String result = '/result';

  static final route = GoRouter(
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: normalMode,
        builder: (context, state) => const NormalModeView(),
      ),
      GoRoute(
        path: competitionMode,
        builder: (context, state) => const CompetitionModeView(),
      ),
      GoRoute(
        path: normalGame,
        builder: (context, state) => NormalGameView(
          numberOfPlayers: state.extra as int,
        ),
      ),
      GoRoute(
        path: competitionGame,
        builder: (context, state) => const CompetitionGameView(),
      ),
      GoRoute(
        path: result,
        builder: (context, state) => const ResultView(),
      ),
    ],
  );
}

import 'package:go_router/go_router.dart';
import 'package:skrew/features/competition/views/competition_view/competition_view.dart';
import 'package:skrew/features/competition/views/home_view/home_view.dart';
import 'package:skrew/features/splash/splash_view.dart';

import '../../features/competition/views/result_view/result_view.dart';

abstract class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String competition = '/competition';
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
        path: competition,
        builder: (context, state) => const CompetitionView(),
      ),
      GoRoute(
        path: result,
        builder: (context, state) => const ResultView(),
      ),
    ],
  );
}

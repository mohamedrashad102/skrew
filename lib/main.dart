import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/common/theme/dark_theme.dart';
import 'package:skrew/features/home/cubits/players_name_cubit.dart';
import 'package:skrew/features/home/cubits/players_number_cubit.dart';

import 'features/normal_game/cubits/normal_game_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlayersNumberCubit()),
        BlocProvider(create: (context) => PlayersNameCubit()),
        BlocProvider(create: (context) => NormalGameCubit()),
      ],
      child: MaterialApp.router(
        darkTheme: darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.route,
      ),
    );
  }
}

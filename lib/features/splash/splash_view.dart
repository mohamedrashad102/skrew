import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skrew/common/routes/app_routes.dart';

import 'widgets/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      _navigateToHomeScreen,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Logo(),
      ),
    );
  }

  _navigateToHomeScreen() {
    context.go(AppRoutes.home);
  }
}

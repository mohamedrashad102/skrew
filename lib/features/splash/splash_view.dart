import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/features/splash/widgets/splah_photo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    Future.delayed(
      const Duration(seconds: 1, milliseconds: 500),
      _navigateToHomeScreen,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _offsetAnimation,
          child: const SplashPhoto(),
        ),
      ),
    );
  }

  _navigateToHomeScreen() {
    context.go(AppRoutes.playersNumber);
  }
}

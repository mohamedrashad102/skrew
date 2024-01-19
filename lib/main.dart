import 'package:flutter/material.dart';
import 'package:skrew/common/routes/app_routes.dart';
import 'package:skrew/common/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes.route,
    );
  }
}

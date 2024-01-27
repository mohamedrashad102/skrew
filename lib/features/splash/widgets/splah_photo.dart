import 'package:flutter/material.dart';
import 'package:skrew/common/constants/app_images.dart';

class SplashPhoto extends StatelessWidget {
  const SplashPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.splash, height: 100);
  }
}

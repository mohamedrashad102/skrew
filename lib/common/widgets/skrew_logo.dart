import 'package:flutter/material.dart';

import '../constants/app_images.dart';

class SkrewLogo extends StatelessWidget {
  const SkrewLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      height: 80,
      width: 160,
    );
  }
}

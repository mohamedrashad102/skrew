import 'package:flutter/material.dart';

import '../../../common/constants/app_images.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.logo,
      height: 200,
      width: 300,
    );
  }
}

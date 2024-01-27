import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skrew/common/utils/coloors.dart';

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0XFF202c33),
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  ),
  scaffoldBackgroundColor: Coloors.scaffoldBgColor,
  // scaffoldBackgroundColor: const Color(0XFF111b21),
);
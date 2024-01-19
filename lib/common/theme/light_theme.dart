import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skrew/common/utils/coloors.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: AppBarTheme(
    backgroundColor: Coloors.appBarBgColor,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ),
  ),
);

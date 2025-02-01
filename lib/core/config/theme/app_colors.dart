import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const white = Color(0xffFFFFFF);
  static const mainBgColor = Color(0xff252525);
  static const appBarItemBgColor = Color(0xff3B3B3B);
  static const shadowColor = Color(0x66000000);
  static const red = Color(0xffFF0000);
  static const hintColor = Color(0xff9A9A9A);

  static const green = Color(0xff30BE71);

  static const colorsList = [
    0xffFD99FF,
    0xffFF9E9E,
    0xff91F48F,
    0xffFFF599,
    0xff9EFFFF,
    0xffB69CFF,
  ];
  static int getRandomColor() {
    final random = Random();

    return colorsList[random.nextInt(colorsList.length)];
  }
}

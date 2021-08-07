import 'package:flutter/material.dart';

class AppColors {
  static const Color cyan = Color(0xFF44C2FD);
  static const Color purple = Color(0XFF343090);
  static const Color green = Color(0XFF58B368);
  static const Color pink = Color(0XFFF5487F);
  static const Color yellow = Color(0XFFFAC736);
  static const Color black87 = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color black54 = Color.fromRGBO(0, 0, 0, 0.54);
  static const Color black26 = Color.fromRGBO(0, 0, 0, 0.26);
  static const Color mercuryBackground = Color(0xFFE5E5E5);
  static const Color minsk = Color(0xFF343090);
  static const Color greyGoogle = Color.fromRGBO(0, 0, 0, 0.26);
  static const Color blue = Color.fromRGBO(58, 91, 150, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color black38 = Color.fromRGBO(0, 0, 0, 0.38);
  static const Color drawerItemBorder = Color.fromRGBO(224, 224, 224, 1);
  static const Color lightPurple = Color(0XFFA29EFF);

  static const linearGradient = LinearGradient(
    colors: <Color>[
      cyan,
      purple,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.7,
    ],
    transform: GradientRotation((-34 * 3.141592) / 180),
  );
}

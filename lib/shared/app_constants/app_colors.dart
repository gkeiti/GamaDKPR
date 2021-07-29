import 'package:flutter/material.dart';

class AppColors {
  static const Color cyan = Color(0xFF44C2FD);
  static const Color purple = Color(0XFF343090);
  static const Color green = Color(0XFF58B368);
  static const Color pink = Color(0XFFF5487F);
  static const Color yellow = Color(0XFFFAC736);
  static const Color black54 = Color.fromRGBO(0, 0, 0, 0.54);

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

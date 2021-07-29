import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';

class TextStyles {
  static const TextStyle white72w700Montserrat = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    fontSize: 72.0,
    letterSpacing: -3.6,
    color: Colors.white,
  );
  static const TextStyle white11w400Montserrat = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 11.0,
    letterSpacing: 0.88,
    color: Colors.white,
  );
  static const TextStyle white12w300Roboto = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
    fontSize: 12.0,
    letterSpacing: 0.40,
    color: Colors.white,
  );
  static const TextStyle cyan48w400Roboto = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 48.0,
    color: AppColors.cyan,
  );
  static const TextStyle black16w400Roboto = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
    letterSpacing: 0.15,
    color: AppColors.black54,
  );
  static const TextStyle createAccountButton = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    fontSize: 16.0,
    letterSpacing: 0.15,
    color: AppColors.purple,
  );
  static const TextStyle continueButton = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
    letterSpacing: 0.4,
    color: Colors.white,
  );
}

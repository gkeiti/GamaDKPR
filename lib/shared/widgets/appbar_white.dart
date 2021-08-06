import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';

class AppBarWhiteWidget extends AppBar {
  AppBarWhiteWidget()
      : super(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: AppColors.white,
          elevation: 0.0,
        );
}

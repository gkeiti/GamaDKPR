import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class ExtendedGradientContainer extends StatelessWidget {
  const ExtendedGradientContainer({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);

  final String pageTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 189,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.cyan,
            AppColors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.05,
            0.7,
          ],
          transform: GradientRotation((36 * 3.141592) / 180),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 85.0),
          child: Text(
            pageTitle,
            style: TextStyles.white26w700Roboto,
          ),
        ),
      ),
    );
  }
}

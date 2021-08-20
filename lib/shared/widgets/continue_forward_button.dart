import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class ContinueForwardButton extends StatelessWidget {
  const ContinueForwardButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 116,
      height: 32,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            AppColors.cyan,
            AppColors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            0.1,
            0.7,
          ],
          transform: GradientRotation((38 * 3.141592) / 180),
        ),
        borderRadius: BorderRadius.circular(34),
      ),
      child: MaterialButton(
        padding: EdgeInsets.only(
          left: 6.0,
          top: 4.0,
          bottom: 4.0,
          right: 6.0,
        ),
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "CONTINUAR",
              style: TextStyles.continueButton,
            ),
            Icon(
              Icons.arrow_forward,
              size: 18.0,
              color: AppColors.white,
            ),
          ],
        ),
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}

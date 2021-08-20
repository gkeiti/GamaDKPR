import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class ContinueButton extends StatelessWidget {
  final Function() onPressed;
  const ContinueButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
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
        onPressed: this.onPressed,
        child: Text(
          "CONTINUAR",
          style: TextStyles.continueButton,
        ),
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34),
        ),
      ),
    );
  }
}

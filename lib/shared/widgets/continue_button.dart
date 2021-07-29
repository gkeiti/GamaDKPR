import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 114,
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
        onPressed: () {},
        child: Row(
          children: [
            Flexible(
              child: Text(
                "CONTINUAR",
                style: TextStyles.continueButton,
              ),
            ),
            /* Icon(
              Icons.arrow_forward,
              size: 8,
            ), */
          ],
        ),
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        //disabledTextColor: Color.fromRGBO(0, 0, 0, 0.26),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(34),
        ),
      ),
    );
  }
}

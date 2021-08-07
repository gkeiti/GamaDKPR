import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 94,
      height: 32,
      decoration: BoxDecoration(),
      child: MaterialButton(
        padding: EdgeInsets.only(
          left: 4.0,
          top: 4.0,
          bottom: 4.0,
          right: 6.0,
        ),
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.arrow_back,
              size: 20.0,
              color: AppColors.black26,
            ),
            Text(
              "VOLTAR",
              style: TextStyles.black26_14w500Roboto,
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

import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class InsertButton extends StatelessWidget {
  const InsertButton(
      {Key? key, required this.onPressed, required this.buttonEnabled})
      : super(key: key);

  final Future<void> Function() onPressed;
  final buttonEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[AppColors.cyan, AppColors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.7],
          transform: GradientRotation((38 * 3.141592) / 180),
        ),
        borderRadius: BorderRadius.circular(34),
      ),
      child: MaterialButton(
        onPressed: buttonEnabled == true ? onPressed : null,
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.add, color: Colors.white),
                  Text("INSERIR", style: TextStyles.white14w500Roboto),
                ],
              ),
            ),
          ],
        ),
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
      ),
    );
  }
}

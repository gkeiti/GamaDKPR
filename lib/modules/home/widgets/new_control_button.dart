import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';

class NewControlButton extends StatelessWidget {
  const NewControlButton({Key? key, required this.user}) : super(key: key);
  final UserData? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 182,
      height: 40,
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
        onPressed: () {
          Navigator.pushNamed(context, '/home/transactions_control',
              arguments: user);
        },
        child: Row(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text("NOVO CONTROLE",
                        style: TextStyles.white14w500Roboto),
                  ),
                ],
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
      ),
    );
  }
}

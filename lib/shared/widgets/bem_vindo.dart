import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class BemVindoWidget extends StatelessWidget {
  const BemVindoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Bem-vindo!",
      style: TextStyles.cyan48w400Roboto,
    );
  }
}

import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class BemVindoCommentWidget extends StatelessWidget {
  final String label;

  const BemVindoCommentWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$label",
      style: TextStyles.minsk20w500Roboto,
    );
  }
}

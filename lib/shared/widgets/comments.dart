import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class CommentsWidget extends StatelessWidget {
  const CommentsWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        "$text",
        style: TextStyles.black16w400Roboto,
      ),
    );
  }
}

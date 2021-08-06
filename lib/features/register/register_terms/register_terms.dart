import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/appbar_white.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo_comment.dart';
import 'package:trabalho_final_dgpr/shared/widgets/comments.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';

class RegisterTermsPage extends StatefulWidget {
  const RegisterTermsPage({Key? key}) : super(key: key);

  @override
  _RegisterTermsPageState createState() => _RegisterTermsPageState();
}

class _RegisterTermsPageState extends State<RegisterTermsPage> {
  bool? _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWhiteWidget(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 0.0,
                left: 48.0,
              ),
              child: LogoBudgetWidget(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 70.0,
                left: 48.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BemVindoWidget(),
                  BemVindoCommentWidget(
                    label: "Leia com atenção e aceite.",
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 27.0,
                top: 194.0,
                right: 27.0,
              ),
              child: CommentsWidget(
                text: "Lorem Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Ipsum neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nque porro  est qui dolorem ipsum quia dolor sit amet, , adipisci velit. Quisquam est qui dolorem ipsum.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 491.0,
                left: 16.0,
                right: 16.0,
              ),
              child: CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Eu li e aceito os termos e condições e a Política de privacidade do budget.",
                  style: TextStyles.black16w400Roboto,
                ),
                value: _checked,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (value) {
                  setState(() {
                    _checked = value;
                  });
                },
                activeColor: AppColors.minsk,
                checkColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
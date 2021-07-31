import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo_comment.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';

class RegisterNameEmailPage extends StatefulWidget {
  const RegisterNameEmailPage({Key? key}) : super(key: key);

  @override
  _RegisterNameEmailPageState createState() => _RegisterNameEmailPageState();
}

class _RegisterNameEmailPageState extends State<RegisterNameEmailPage> {
  TextEditingController? _nameController = TextEditingController();
  TextEditingController? _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.white,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 48.0,
            child: LogoBudgetWidget(),
          ),
          Positioned(
            top: 70.0,
            left: 48.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BemVindoWidget(),
                BemVindoCommentWidget(
                  label: "Por favor insira seus dados \nno campos abaixo.",
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 144.0, left: 48.0, right: 49.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputText(
                  autofocus: false,
                  controller: _nameController,
                  onChanged: (value) => _nameController?.value,
                  label: 'Nome',
                  textInputType: TextInputType.name,
                  validator: (String? value) {},
                ),
                SizedBox(height: 32.0),
                InputText(
                  autofocus: false,
                  controller: _emailController,
                  onChanged: (value) => _emailController?.value,
                  label: 'E-mail',
                  textInputType: TextInputType.emailAddress,
                  validator: (String? value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

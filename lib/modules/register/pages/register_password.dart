import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/register/user_repository.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';
import 'package:trabalho_final_dgpr/shared/widgets/appbar_white.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo_comment.dart';
import 'package:trabalho_final_dgpr/shared/widgets/comments.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';

class RegisterPasswordPage extends StatefulWidget {
  final GlobalKey<FormState> passwordKey;
  final RegisterUser? user;
  final TextEditingController passwordController;
  const RegisterPasswordPage({
    Key? key,
    required this.passwordKey,
    this.user,
    required this.passwordController,
  }) : super(key: key);

  @override
  _RegisterPasswordPageState createState() => _RegisterPasswordPageState();
}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  Validator validator = Validator();

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    widget.passwordController.dispose();
    confirmPasswordController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BemVindoWidget(),
                  BemVindoCommentWidget(
                    label: "Agora crie sua senha contendo:",
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 45.0,
                top: 194.0,
                right: 45.0,
              ),
              child: CommentsWidget(
                text:
                    "• Pelo menos oito caracteres; \n• Letras maiúsculas, letras minúsculas, números e símbolos.",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 280.0, left: 48.0, right: 49.0),
              child: Form(
                key: widget.passwordKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(
                      textInputAction: TextInputAction.next,
                      controller: widget.passwordController,
                      label: 'Crie uma senha',
                      textInputType: TextInputType.text,
                      validator: (value) => validator.isPasswordValid(value!),
                      onChanged: (String? value) => widget.passwordController.text,
                    ),
                    SizedBox(height: 32.0),
                    InputText(
                      focusNode: _focusNode,
                      textInputAction: TextInputAction.done,
                      controller: confirmPasswordController,
                      label: 'Confirme sua senha',
                      textInputType: TextInputType.text,
                      validator: (value) =>
                          validator.setConfirmPassword(value!, value),
                      onChanged: (String? value) => confirmPasswordController.text,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

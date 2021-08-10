import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validators.dart';
import 'package:trabalho_final_dgpr/shared/widgets/appbar_white.dart';
import 'package:trabalho_final_dgpr/shared/widgets/back_button_widget.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo_comment.dart';
import 'package:trabalho_final_dgpr/shared/widgets/comments.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_forward_button.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';

class RegisterPasswordPage extends StatefulWidget {
  const RegisterPasswordPage({Key? key}) : super(key: key);

  @override
  _RegisterPasswordPageState createState() => _RegisterPasswordPageState();
}

class _RegisterPasswordPageState extends State<RegisterPasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  final GlobalKey<FormState>? passwordKey = GlobalKey<FormState>();
  Validators validators = Validators();

  String password = "";
  String confirmPassword = "";

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                key: passwordKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Observer(builder: (_) {
                      return InputText(
                        textInputAction: TextInputAction.next,
                        controller: _passwordController,
                        onChanged: (value) => validators.setPassword(value!),
                        label: 'Crie uma senha',
                        textInputType: TextInputType.text,
                        validator: (value) => validators.isPasswordValid(),
                        onSaved: (String? value) {
                          this.password = value!;
                        },
                      );
                    }),
                    SizedBox(height: 32.0),
                    Observer(builder: (_) {
                      return InputText(
                        focusNode: _focusNode,
                        textInputAction: TextInputAction.done,
                        controller: _confirmPasswordController,
                        onChanged: (value) =>
                            validators.setConfirPassword(value!),
                        label: 'Confirme sua senha',
                        textInputType: TextInputType.text,
                        validator: (value) => validators.setConfirmPassword(),
                        onSaved: (String? value) {
                          this.confirmPassword = value!;
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 650, 16, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonWidget(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ContinueForwardButton(
                    onPressed: () {
                      if (passwordKey!.currentState!.validate()) {
                        Navigator.pushNamed(context, "/register_onboarding");
                        
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

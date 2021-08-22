import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';
import 'package:trabalho_final_dgpr/shared/widgets/appbar_white.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo_comment.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';

import '../../user_repository.dart';

class RegisterNameEmailPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final RegisterUser? user;

  const RegisterNameEmailPage({
    Key? key,
    required this.formKey,
    this.user,
  }) : super(key: key);

  @override
  _RegisterNameEmailPageState createState() => _RegisterNameEmailPageState();
}

class _RegisterNameEmailPageState extends State<RegisterNameEmailPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  FocusNode _myFocusNode = FocusNode();

  final Validator validator = Validator();


  @override
  void initState() {
    _myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _nameController.dispose();
    _emailController.dispose();
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
              padding: EdgeInsets.only(top: 280.0, left: 48.0, right: 49.0),
              child: Form(
                key: widget.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(
                      controller: _nameController,
                      label: 'Nome',
                      textInputType: TextInputType.name,
                      validator: (value) => validator.validatorName(value!),
                      onChanged: (String? value) {
                        widget.user?.name = value;
                      },
                    ),
                    SizedBox(height: 32.0),
                    InputText(
                      controller: _emailController,
                      label: 'E-mail',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) => validator.isEmailValid(value!),
                      onChanged: (String? value) {
                        widget.user?.email = value;
                      },
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
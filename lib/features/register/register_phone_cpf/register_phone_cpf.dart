import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/input_validators.dart';
import 'package:trabalho_final_dgpr/shared/widgets/appbar_white.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo.dart';
import 'package:trabalho_final_dgpr/shared/widgets/bem_vindo_comment.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class RegisterPhoneCpfPage extends StatefulWidget {
  const RegisterPhoneCpfPage({Key? key}) : super(key: key);

  @override
  _RegisterPhoneCpfPageState createState() => _RegisterPhoneCpfPageState();
}

class _RegisterPhoneCpfPageState extends State<RegisterPhoneCpfPage> {
  MaskedTextController _phoneController =
      MaskedTextController(mask: "(00)00000-0000");
  MaskedTextController _cpfController =
      MaskedTextController(mask: "000.000.000-00");
  FocusNode _myFocusNode = FocusNode();

  final GlobalKey<FormState>? phoneCpfKey = GlobalKey<FormState>();

  @override
  void initState() {
    _myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _phoneController.dispose();
    _cpfController.dispose();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BemVindoWidget(),
                  BemVindoCommentWidget(
                    label: "Mais alguns dados.",
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 280.0, left: 48.0, right: 49.0),
              child: Form(
                key: phoneCpfKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputText(
                      textInputAction: TextInputAction.next,
                      controller: _phoneController,
                      onChanged: (value) => _phoneController.value,
                      label: 'Telefone',
                      textInputType: TextInputType.phone,
                      validator: (String? phone) {
                        InputValidators().phoneValidator(phone);
                      },
                    ),
                    SizedBox(height: 32.0),
                    InputText(
                      focusNode: _myFocusNode,
                      textInputAction: TextInputAction.done,
                      controller: _cpfController,
                      onChanged: (value) => _cpfController.value,
                      label: 'CPF',
                      helperText:
                          "O CPF é necessário para conectar suas contas.",
                      textInputType: TextInputType.number,
                      validator: (String? cpf) {
                        InputValidators().cpfValidator(cpf);
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

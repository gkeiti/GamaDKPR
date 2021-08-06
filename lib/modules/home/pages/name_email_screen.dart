import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_button.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';

class NameEmail extends StatefulWidget {
  const NameEmail({Key? key}) : super(key: key);

  @override
  _NameEmailState createState() => _NameEmailState();
}

class _NameEmailState extends State<NameEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 74,
                  right: 212,
                  left: 48,
                ),
                child: Image.asset('assets/images/budget_logo_black.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.15,
                  left: 48,
                  right: 112,
                ),
                child: Container(
                  child: Text(
                    'Bem-vindo!',
                    style: TextStyles.cyan48w400Roboto,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 57,
                  bottom: 130,
                ),
                child: Text(
                  'Por favor insira seus dados\nnos campos abaixo.',
                  style: TextStyles.purple20w600Roboto,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 48, right: 48, bottom: 50),
                child: InputText(
                  label: 'Nome',
                  obscureText: false,
                  textInputType: TextInputType.text,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: InputText(
                  label: 'Insira seu e-mail',
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/login');
            },
            child: Text(
              'VOLTAR',
              style: TextStyles.grey14w500Roboto,
            ),
          ),
          Text(
            '1/4',
            style: TextStyles.black14w400Robotoblack,
          ),
          ContinueButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tel_cpf');
            },
          ),
        ],
      ),
    );
  }
}
// precisa ajeitar o posicionamento dos botoes
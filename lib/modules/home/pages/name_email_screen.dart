import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
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
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Roboto',
                      color: AppColors.cyan,
                    ),
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
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.15,
                    color: AppColors.purple,
                  ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 56.5,
              bottom: 20,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/login');
              },
              child: Text(
                'VOLTAR',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyGoogle,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: Text(
              '1/4',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 56.5,
              bottom: 16,
            ),
            child: ContinueButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tel_cpf');
              },
            ),
          ),
        ],
      ),
    );
  }
}
// precisa ajeitar o posicionamento dos botoes
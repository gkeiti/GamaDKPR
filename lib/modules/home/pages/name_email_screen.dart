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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(48, 74, 48, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Image.asset('assets/images/budget_logo_black.png'),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 112),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bem-vindo!',
                      style: TextStyles.cyan48w400Roboto,
                    ),
                    Text(
                      'Por favor insira seus dados\nnos campos abaixo.',
                      style: TextStyles.purple20w600Roboto,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: InputText(
                        label: 'Nome',
                        obscureText: false,
                        textInputType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: InputText(
                        label: 'Insira seu e-mail',
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: Positioned(
          bottom: 0,
          child: Row(
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
        ),
      ),
    );
  }
}

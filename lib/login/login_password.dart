import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_button.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({Key? key}) : super(key: key);

  @override
  _LoginPasswordState createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
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
                  // width: 200,
                  height: 112,
                  child: Text(
                    'Insira sua senha',
                    style: TextStyle(
                      fontSize: 48,
                      fontFamily: 'Roboto',
                      color: AppColors.cyan,
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(left: 48, right: 48, bottom: 50, top: 100),
                child: InputText(
                  label: 'Insira seu e-mail',
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: InputText(
                  label: 'Senha',
                  obscureText: true,
                  textInputType: TextInputType.text,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text('RECUPERAR SENHA', style: TextStyles.purple14w500Roboto,),
                    onPressed: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      // left: 198,
                    ),
                    child: ContinueButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

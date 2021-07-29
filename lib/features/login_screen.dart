import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 144,
              left: 48,
              right: 112,
            ),
            child: Container(
              width: 200,
              height: 112,
              child: Text(
                'Vamos começar!',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Roboto',
                  color: AppColors.cyan,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 80,
                ),
                child: Text(
                  'Novo usuário?',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    letterSpacing: 0.15,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Crie uma conta!',
                  style: TextStyles.createAccountButton,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 48),
            child: InputText(
              label: 'Insira seu e-mail',
              obscureText: true,
              textInputType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}

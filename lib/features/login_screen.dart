import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_button.dart';
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/name_email');
                    },
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
                  obscureText: false,
                  textInputType: TextInputType.emailAddress,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 198,
                  // right: 48,
                ),
                child: ContinueButton(
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 9,
                  top: 104,
                ),
                child: Text('ou'),
              ),
              Container(
                width: 267,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyGoogle),
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox.expand(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/continue_google.png'),
                        // Icon(Icons.ac_unit),
                        // // MaterialButton(
                        //   // onPressed: () {},
                        //   // child:
                        //   Text(
                        //     'CONTINUAR COM O GOOGLE',
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.w500,
                        //       // botei weight de 500 pq é como ta mandando no figma, mas acho que o 600 ta melhor
                        //       letterSpacing: 0.46,
                        //       fontSize: 13,
                        //       fontStyle: FontStyle.normal,
                        //       fontFamily: 'Roboto',
                        //       color: AppColors.black54,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 32),
                child: Container(
                  width: 267,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.blue),
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox.expand(
                    child: MaterialButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/facebook_logo.png'),
                          Image.asset('assets/images/continue_facebook.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Tirar a Row do icone do google caso deixe com a imagem mesmo
// eu tava fazendo na mao da forma que eles deixaram no figma, mas tava muito
// diferente, colocando a imagem do icone foi o mais próximo que ficou 
// pode só descomentar o código que ta comentado e comentar 
// a imagem, o sized box e o material button pra ver como ficou
// ta com aquele icone meio aleatorio pq eu tava testando como ficaria pra não baixar
// o do google pra nada
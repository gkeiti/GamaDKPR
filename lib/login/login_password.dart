import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/login/login_controller.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_button.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
import 'login_get_email.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({Key? key}) : super(key: key);

  @override
  _LoginPasswordState createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginController? controller;

  _LoginPasswordState() {
    controller = LoginController(repository: LoginRepositoryImpl());
  }

  ReactionDisposer? disposer;

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      emailController.text = arguments.toString();
      print(emailController.text);
    }
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  padding: EdgeInsets.only(
                      left: 48, right: 48, bottom: 50, top: 100),
                  child: InputText(
                    label: 'Insira seu e-mail',
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 48),
                  child: InputText(
                    label: 'Senha',
                    controller: passwordController,
                    obscureText: true,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if (value.length < 6) {
                        return 'Sua senha deve conter no mínimo 6 caracteres';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: Text(
                        'RECUPERAR SENHA',
                        style: TextStyles.purple14w500Roboto,
                      ),
                      onPressed: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                      ),
                      child: ContinueButton(
                        onPressed: () async {
                          UserData? user =
                              await context.read<AuthService>().signIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                          user != null
                              ? Navigator.pushNamed(context, '/home',
                                  arguments: user)
                              : AlertDialog(
                                  title: Text('Erro ao fazer login'),
                                  content: Text(
                                    'Tente novamente mais tarde',
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Ok'))
                                  ],
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

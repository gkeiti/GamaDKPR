import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_dgpr/modules/login/login_controller.dart';
import 'package:trabalho_final_dgpr/modules/login/login_repository.dart';
import 'package:trabalho_final_dgpr/modules/register/user_repository.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_button.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({Key? key}) : super(key: key);

  @override
  _LoginPasswordState createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginController? controller;
  Validator validator = Validator();
  RegisterUser? user = RegisterUser();

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
                    controller: emailController,
                    label: 'Insira seu e-mail',
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (String? value) =>
                        validator.isEmailValidLogin(value!),
                    onChanged: (String? value) {
                      user?.email = value;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 48),
                  child: InputText(
                    maxLines: 1,
                    label: 'Senha',
                    controller: passwordController,
                    obscureText: true,
                    textInputType: TextInputType.text,
                    validator: (String? value) =>
                        validator.isPasswordValidLogin(value!),
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
                          var connectivityResult =
                              await (Connectivity().checkConnectivity());
                          if (connectivityResult == ConnectivityResult.wifi ||
                              connectivityResult == ConnectivityResult.mobile) {
                            showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(48.0),
                                  child: CircularProgressIndicator(
                                    color: AppColors.cyan,
                                  ),
                                ),
                              ),
                            );
                            UserData? user =
                                await context.read<AuthService>().signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                            if (user != null) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/home', (route) => false,
                                  arguments: user);
                            } else {
                              Future.delayed(Duration(seconds: 1)).then(
                                (value) async {
                                  formKey.currentState!.validate();
                                  Navigator.pop(context);
                                },
                              );
                            }
                          } else {
                            Navigator.pushNamed(context, '/error_home_page');
                          }
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

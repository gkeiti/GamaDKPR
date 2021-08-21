import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/features/user_repository.dart';
import 'package:trabalho_final_dgpr/login/login_get_email.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_button.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late LoginController controller;
  Validator validator = Validator();
  RegisterUser? user = RegisterUser();

  _LoginScreenState() {
    controller = LoginController(repository: LoginRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
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
                    // width: 200,
                    // height: 112,
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
                        Navigator.pushNamed(context, '/register_pageview');
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
                      controller: emailController,
                      label: 'Insira seu e-mail',
                      obscureText: false,
                      textInputType: TextInputType.emailAddress,
                      validator: (String? value) =>
                          validator.isEmailValidLogin(value!),
                      onChanged: (String? value) {
                        user?.email = value;
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 198,
                  ),
                  child: ContinueButton(
                    onPressed: () async {
                      bool result = await controller.repository
                          .getEmail(emailController.text);
                      if (result == false) {
                        formKey.currentState!.validate();
                      } else {
                        Navigator.pushNamed(context, '/login_password',
                            arguments: emailController.text);
                      }
                    },
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox.expand(
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/images/google_icon.png'),
                          Text(
                            'CONTINUAR COM O GOOGLE',
                            style: TextStyles.black54_13w500Roboto,
                          ),
                          // Image.asset('assets/images/continue_google.png'),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/facebook_logo.png'),
                            Text(
                              'CONTINUAR COM O FACEBOOK',
                              style: TextStyles.white13w500Roboto,
                            ),
                            // Image.asset('assets/images/continue_facebook.png'),
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
      ),
    );
  }
}

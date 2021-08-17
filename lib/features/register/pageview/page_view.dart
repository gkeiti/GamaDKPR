import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/features/register/register_name_email/register_name_email.dart';
import 'package:trabalho_final_dgpr/features/register/register_password/register_password.dart';
import 'package:trabalho_final_dgpr/features/register/register_phone_cpf/register_phone_cpf.dart';
import 'package:trabalho_final_dgpr/features/register/register_terms/register_terms.dart';
import 'package:trabalho_final_dgpr/features/user_repository.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validators.dart';
import 'package:trabalho_final_dgpr/shared/widgets/back_button_widget.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_forward_button.dart';

import '../register_control_repository.dart';

class RegisterPageView extends StatefulWidget {
  final RegisterUser? user;
  const RegisterPageView({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  final GlobalKey<FormState> nameEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneCpfKey = GlobalKey<FormState>();
  final GlobalKey<FormState> termsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  int currentIndex = 0;
  
  Validator validator = Validator();
  RegisterControlRepository? repository;
  RegisterUser? user;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) => currentIndex = index,
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              RegisterNameEmailPage(
                formKey: nameEmailKey,
              ),
              RegisterPhoneCpfPage(
                phoneCpfKey: phoneCpfKey,
              ),
              RegisterTermsPage(
                termsKey: termsKey,
              ),
              RegisterPasswordPage(
                passwordKey: passwordKey,
              ),
            ],
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonWidget(
                      onPressed: () {
                        controller.previousPage(
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    ),
                    ContinueForwardButton(
                      onPressed: () {
                        if (currentIndex == 0 &&
                            nameEmailKey.currentState!.validate()) {
                          controller.animateToPage(1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        } else if (currentIndex == 1 &&
                            phoneCpfKey.currentState!.validate()) {
                          controller.animateToPage(2,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        } else if (currentIndex == 2 &&
                            termsKey.currentState!.validate()) {
                          controller.animateToPage(3,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        } else if (currentIndex == 3 &&
                            passwordKey.currentState!.validate()) {
                          repository?.createAccount(user!);
                          Navigator.pushNamed(context, "/register_onboarding");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

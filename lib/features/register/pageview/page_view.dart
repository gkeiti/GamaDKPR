import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/features/register/register_name_email/register_name_email.dart';
import 'package:trabalho_final_dgpr/features/register/register_password/register_password.dart';
import 'package:trabalho_final_dgpr/features/register/register_phone_cpf/register_phone_cpf.dart';
import 'package:trabalho_final_dgpr/features/register/register_terms/register_terms.dart';
import 'package:trabalho_final_dgpr/shared/widgets/back_button_widget.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_forward_button.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
<<<<<<< HEAD
  final GlobalKey<FormState> nameEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneCpfKey = GlobalKey<FormState>();
  final GlobalKey<FormState> termsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
=======
  final GlobalKey<FormState>? nameEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState>? phoneCpfKey = GlobalKey<FormState>();
  final GlobalKey<FormState>? termsKey = GlobalKey<FormState>();
  final GlobalKey<FormState>? passwordKey = GlobalKey<FormState>();
>>>>>>> d9ee53fb75ceae58af21a91375b662a8fda9df73

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: [
              RegisterNameEmailPage(
                key: nameEmailKey, 
              ),
              RegisterPhoneCpfPage(
                key: phoneCpfKey,
              ),
              RegisterTermsPage(),
              RegisterPasswordPage(
                key: passwordKey,
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
                        
                        if (controller.initialPage == 0 &&
                            nameEmailKey.currentState!.validate()) {
                          controller.animateToPage(1, duration: Duration(milliseconds: 400), curve: Curves.easeIn);
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

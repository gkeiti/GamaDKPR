import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/features/register/register_name_email/register_name_email.dart';
import 'package:trabalho_final_dgpr/features/register/register_password/register_password.dart';
import 'package:trabalho_final_dgpr/features/register/register_phone_cpf/register_phone_cpf.dart';
import 'package:trabalho_final_dgpr/features/register/register_terms/register_terms.dart';
import 'package:trabalho_final_dgpr/features/user_repository.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';
import 'package:trabalho_final_dgpr/shared/widgets/back_button_widget.dart';
import 'package:trabalho_final_dgpr/shared/widgets/continue_forward_button.dart';
import 'page_view_controller.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  final GlobalKey<FormState> nameEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneCpfKey = GlobalKey<FormState>();
  final GlobalKey<FormState> termsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  final indexController = PageViewController();

  Validator validator = Validator();
  RegisterUser? user = RegisterUser();

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: PageView(
        onPageChanged: (index) => indexController.currentIndex = index,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          RegisterNameEmailPage(
            formKey: nameEmailKey,
            user: user,
          ),
          RegisterPhoneCpfPage(
            phoneCpfKey: phoneCpfKey,
            user: user,
          ),
          RegisterTermsPage(
            termsKey: termsKey,
            user: user,
          ),
          RegisterPasswordPage(
            passwordKey: passwordKey,
            user: user,
            passwordController: passwordController,
          ),
        ],
      ),
      bottomSheet: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButtonWidget(
                onPressed: () {
                  if (indexController.currentIndex == 0) {
                    Navigator.pushReplacementNamed(context, "/login");
                  } else {
                    controller.previousPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  }
                },
              ),
              Container(
                height: 20.0,
                width: 28.0,
                child: Observer(builder: (_) {
                  return Text(
                    "${indexController.updateIndex(indexController.currentIndex)}",
                    style: TextStyles.black87_14w400Roboto,
                  );
                }),
              ),
              ContinueForwardButton(
                onPressed: () async {
                  if (indexController.currentIndex == 0 &&
                      nameEmailKey.currentState!.validate()) {                        
                    final _response = await FirebaseFirestore.instance
                        .collection("/users")
                        .where("email", isEqualTo: "${user!.email}")
                        .get();
                    if (_response.docs.isEmpty) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(48.0),
                            child: LinearProgressIndicator(
                              color: AppColors.cyan,
                              minHeight: 4.0,
                            ),
                          ),
                        ),
                      );
                      Future.delayed(Duration(seconds: 1))
                          .then((value) => Navigator.pop(context))
                          .then((value) => controller.animateToPage(1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn));
                    } else {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: AlertDialog(
                              title: Text(
                                "Email já Cadastrado, \npor favor inserir outro!",
                                style: TextStyles.minsk20w500Roboto,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  } else if (indexController.currentIndex == 1 &&
                      phoneCpfKey.currentState!.validate()) {
                    controller.animateToPage(2,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  } else if (indexController.currentIndex == 2 &&
                      termsKey.currentState!.validate() == true) {
                    controller.animateToPage(3,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeIn);
                  } else if (indexController.currentIndex == 3 &&
                      passwordKey.currentState!.validate()) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => Center(
                        child: Padding(
                          padding: const EdgeInsets.all(48.0),
                          child: LinearProgressIndicator(
                            color: AppColors.cyan,
                            minHeight: 4.0,
                          ),
                        ),
                      ),
                    );
                    final response = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: user!.email!,
                      password: passwordController.text,
                    );
                    final _user = response.user;
                    user!.uid = response.user!.uid;
                    Map<String, dynamic> _userMap = user!.toMap();
                    await FirebaseFirestore.instance
                        .collection("/users")
                        .doc(_user!.uid)
                        .set(_userMap);
                    Future.delayed(Duration(seconds: 1)).then((value) =>
                        Navigator.pushNamed(context, "/register_onboarding"));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

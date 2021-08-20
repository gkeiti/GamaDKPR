import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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


class RegisterPageView extends StatefulWidget {
  const RegisterPageView({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> nameEmailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneCpfKey = GlobalKey<FormState>();
  final GlobalKey<FormState> termsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  late AnimationController _animationController;

  int currentIndex = 0;

  Validator validator = Validator();
  RegisterUser? user = RegisterUser();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    _animationController.repeat(reverse: false);
    super.initState();
  }

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
                        if (currentIndex == 0) {
                          Navigator.pushReplacementNamed(context, "/login");
                        } else {
                          controller.previousPage(
                              duration: Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        }
                      },
                    ),
                    Text(
                      "${currentIndex + 1}/4",
                      style: TextStyles.black87_14w400Roboto,
                    ),
                    ContinueForwardButton(
                      onPressed: () async {
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
                          final response = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: user!.email!,
                                  password: user!.password!);
                          final _user = response.user;
                          user!.uid = response.user!.uid;
                          Map<String, dynamic> _userMap = user!.toMap();

                          await FirebaseFirestore.instance
                              .collection("/users")
                              .doc(_user!.uid)
                              .set(_userMap);

                          CircularProgressIndicator(
                            value: _animationController.value,
                            color: AppColors.minsk,
                          ).hashCode;
                          Future.delayed(Duration(seconds: 3)).then((value) =>
                              Navigator.pushNamed(
                                  context, "/register_onboarding"));
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

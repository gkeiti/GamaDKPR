import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/login/login_password.dart';
import 'login/login_screen.dart';
import 'features/register/pageview/page_view.dart';
import 'features/register/register_name_email/register_name_email.dart';
import 'features/register/register_onboarding/register_onboarding_page.dart';
import 'features/register/register_password/register_password.dart';
import 'features/register/register_phone_cpf/register_phone_cpf.dart';
import 'features/register/register_terms/register_terms.dart';
import 'features/splash/splash_screen.dart';
import 'modules/control/control_page.dart';
import 'modules/home/pages/error_home_page.dart';
import 'modules/home/pages/home_page.dart';
import 'modules/home/pages/update_register_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/login_password': (context) => LoginPassword(),
        '/home': (context) => HomePage(),
        '/home/update_register': (context) => UpdateRegisterScreen(),
        '/home/transactions_control': (context) => TransactionsControl(),
        '/error_home_page': (context) => ErrorHomePage(),
        '/register_pageview': (context) => RegisterPageView(),
        '/register_name_email': (context) => RegisterNameEmailPage(),
        '/register_tel_cpf': (context) => RegisterPhoneCpfPage(),
        '/register_terms': (context) => RegisterTermsPage(),
        '/register_password': (context) => RegisterPasswordPage(),
        '/register_onboarding': (context) => RegisterOnboardingPage(),
      },
    );
  }
}

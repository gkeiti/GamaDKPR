import 'package:flutter/material.dart';

import 'features/login_screen.dart';
import 'features/register/pageview/page_view.dart';
import 'features/register/register_onboarding/register_onboarding_page.dart';
import 'features/splash/splash_screen.dart';
import 'modules/control/all_transactions_page.dart';
import 'modules/control/control_page.dart';
import 'modules/home/pages/error_home_page.dart';
import 'modules/home/pages/home_page.dart';
import 'modules/home/pages/update_register_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  final String uid = '654321';
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
        '/home': (context) => HomePage(uid: uid),
        '/home/update_register': (context) => UpdateRegisterScreen(),
        '/home/transactions_control': (context) =>
            TransactionsControl(uid: uid),
        '/home/all_transactions': (context) => AllTransactionsPage(uid: uid),
        '/error_home_page': (context) => ErrorHomePage(),
        '/register_pageview': (context) => RegisterPageView(),
        '/register_onboarding': (context) => RegisterOnboardingPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabalho_final_dgpr/modules/login/pages/login_password.dart';
import 'package:trabalho_final_dgpr/modules/login/pages/login_screen.dart';
import 'package:trabalho_final_dgpr/modules/register/pages/register_onboarding_page.dart';
import 'package:trabalho_final_dgpr/modules/register/pageview/page_view.dart';
import 'package:trabalho_final_dgpr/modules/splash/splash_screen.dart';
import 'modules/control/pages/all_transactions_page.dart';
import 'modules/control/pages/control_page.dart';
import 'modules/home/pages/error_home_page.dart';
import 'modules/home/pages/home_page.dart';
import 'modules/home/pages/update_register_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    Map<int, Color> color = {
      50: Color.fromRGBO(52, 48, 144, .1),
      100: Color.fromRGBO(52, 48, 144, .2),
      200: Color.fromRGBO(52, 48, 144, .3),
      300: Color.fromRGBO(52, 48, 144, .4),
      400: Color.fromRGBO(52, 48, 144, .5),
      500: Color.fromRGBO(52, 48, 144, .6),
      600: Color.fromRGBO(52, 48, 144, .7),
      700: Color.fromRGBO(52, 48, 144, .8),
      800: Color.fromRGBO(52, 48, 144, .9),
      900: Color.fromRGBO(52, 48, 144, 1),
    };

    MaterialColor colorCustom = MaterialColor(0xFF343090, color);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/login_password': (context) => LoginPassword(),
        '/home': (context) => HomePage(),
        '/home/update_register': (context) => UpdateRegisterScreen(),
        '/home/transactions_control': (context) => TransactionsControl(),
        '/transactions_control': (context) => TransactionsControl(),
        '/all_transactions': (context) => AllTransactionsPage(),
        '/all_transactions/transactions_control': (context) =>
            TransactionsControl(),
        '/error_home_page': (context) => ErrorHomePage(),
        '/register_pageview': (context) => RegisterPageView(),
        '/register_onboarding': (context) => RegisterOnboardingPage(),
      },
    );
  }
}

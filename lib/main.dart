import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/features/login_screen.dart';
import 'package:trabalho_final_dgpr/modules/control/in/in_transaction.dart';
import 'package:trabalho_final_dgpr/modules/control/out/out_transaction.dart';
import 'package:trabalho_final_dgpr/modules/home/pages/home_page.dart';
import 'package:trabalho_final_dgpr/modules/home/pages/name_email_screen.dart';
import 'package:trabalho_final_dgpr/modules/home/pages/update_register_screen.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/update_register': (context) => UpdateRegisterScreen(),
        '/in_transaction': (context) => InTransaction(),
        '/out_transaction': (context) => OutTransaction(),
        '/name_email': (context) => NameEmail(),
        '/tel_cpf': (context) => Container(),
      },
    );
  }
}

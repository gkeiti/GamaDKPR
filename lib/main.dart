import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/control/in/in_transaction.dart';
import 'package:trabalho_final_dgpr/modules/control/out/out_transaction.dart';

import 'package:trabalho_final_dgpr/modules/home/pages/home_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/update_register': (context) => UpdateRegisterScreen(),
        '/in_transaction': (context) => InTransaction(),
        '/out_transaction': (context) => OutTransaction(),
      },
    );
  }
}
/* 
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
 */
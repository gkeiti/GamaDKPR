import 'package:flutter/material.dart';
import 'features/register/register_name_email/register_name_email.dart';
import 'features/register/register_onboarding/register_onboarding_page.dart';
import 'features/register/register_password/register_password.dart';
import 'features/register/register_phone_cpf/register_phone_cpf.dart';
import 'features/register/register_terms/register_terms.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterTermsPage(),
    );
  }
}

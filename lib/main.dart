import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/features/login_screen.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

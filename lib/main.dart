import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/home/pages/home_page.dart';
import 'features/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

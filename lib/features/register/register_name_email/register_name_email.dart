import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';

class RegisterNameEmailPage extends StatefulWidget {
  const RegisterNameEmailPage({ Key? key }) : super(key: key);

  @override
  _RegisterNameEmailPageState createState() => _RegisterNameEmailPageState();
}

class _RegisterNameEmailPageState extends State<RegisterNameEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      
      body: Stack(
        children: [
          Container(
            width: 100.0,
            height: 53.85,
            child: Image.asset("assets/images/logo_budget_2_1.png"),),
        ],
      ),
    );
  }
}
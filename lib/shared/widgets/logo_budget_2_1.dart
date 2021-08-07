import 'package:flutter/material.dart';

class LogoBudgetWidget extends StatelessWidget {
  const LogoBudgetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 53.85,
      child: Image.asset("assets/images/logo_budget_2_1.png"),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    this.user,
    required this.initialPage,
  }) : super(key: key);
  final UserData? user;
  final int initialPage;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.pushNamed(
        context,
        '/all_transactions/transactions_control',
        arguments: {'user': user, 'initialPage': initialPage},
      ),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.linearGradient,
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/balance/balance_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/budget/budget_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/last_transactions/last_transactions_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/new_control_button.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserData? user;

  @override
  Widget build(BuildContext context) {
    final UserData? arguments =
        ModalRoute.of(context)!.settings.arguments as UserData?;
    if (arguments != null) {
      user = arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, ${user!.name}', style: TextStyles.white24w400Roboto),
        centerTitle: true,
        flexibleSpace: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.cyan, AppColors.purple],
              stops: [0.05, 0.6],
              transform: GradientRotation((45 * 3.1415) / 180),
            ),
          ),
        ),
      ),
      drawer: SideDrawer(
        user: user,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BudgetCard(uid: user!.uid),
              SizedBox(height: 16),
              GestureDetector(
                  child: BalanceCard(uid: user!.uid),
                  onTap: () => Navigator.pushNamed(
                      context, '/home/all_transactions',
                      arguments: user)),
              SizedBox(height: 16),
              LastTransactionsCard(uid: user!.uid),
            ],
          ),
        ),
      ),
      floatingActionButton: NewControlButton(
        user: user,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

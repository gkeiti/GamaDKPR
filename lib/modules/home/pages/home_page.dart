import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/balance/balance_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/budget/budget_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/last_transactions/last_transactions_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/new_control_button.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, José', style: TextStyles.white24w400Roboto),
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
      drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BudgetCard(uid: widget.uid),
              SizedBox(height: 16),
              GestureDetector(
                  child: BalanceCard(uid: widget.uid),
                  onTap: () =>
                      Navigator.pushNamed(context, '/home/all_transactions')),
              SizedBox(height: 16),
              LastTransactionsCard(uid: widget.uid),
            ],
          ),
        ),
      ),
      floatingActionButton: NewControlButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

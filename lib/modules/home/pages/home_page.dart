import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/home/home_controller.dart';
import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/balance_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/day_to_day_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/last_transactions_card.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/new_control_button.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(repository: HomeRepositoryImpl());
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
              BalanceCard(),
              SizedBox(height: 16),
              DayToDayCard(),
              SizedBox(height: 16),
              LastTransactionsCard(controller: controller),
            ],
          ),
        ),
      ),
      floatingActionButton: NewControlButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

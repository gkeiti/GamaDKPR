import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/budget/budget_controller.dart';

import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

import 'budget_model.dart';

class BudgetCard extends StatefulWidget {
  const BudgetCard({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  _BudgetCardState createState() => _BudgetCardState(uid);
}

class _BudgetCardState extends State<BudgetCard> {
  final String uid;
  late BudgetCardController controller;

  _BudgetCardState(this.uid) {
    controller = BudgetCardController(HomeRepositoryImpl(), uid);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(17.0),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Saldo geral", style: TextStyles.purple20w500Roboto),
                GestureDetector(
                  child: Icon(Icons.visibility, color: AppColors.purple),
                  onTap: controller.changeVisibility,
                )
              ],
            ),
            Row(
              children: [
                Observer(builder: (_) {
                  List<BudgetModel> budget = controller.budget!.data;
                  if (budget.isEmpty) {
                    return Text(
                      "Sem valores cadastrados",
                      style: TextStyles.black24w400Roboto,
                    );
                  } else {
                    return Visibility(
                      visible: controller.visible,
                      child: Text(
                          'R\$ ' +
                              (budget[0].value / 100)
                                  .toStringAsFixed(2)
                                  .replaceAll('.', ','),
                          style: TextStyles.black24w400Roboto),
                    );
                  }
                })
              ],
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 3,
    );
  }
}

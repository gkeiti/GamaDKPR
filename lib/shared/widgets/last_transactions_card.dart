import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/transactions.dart';

class LastTransactionsCard extends StatefulWidget {
  const LastTransactionsCard({
    Key? key,
  }) : super(key: key);

  @override
  _LastTransactionsCardState createState() => _LastTransactionsCardState();
}

class _LastTransactionsCardState extends State<LastTransactionsCard> {
  String category = 'Refeição';
  String date = '02/08/2021';
  double value = 25.00;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(17.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Últimas transações",
                  style: TextStyles.purple20w500Roboto,
                ),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.purple,
                    size: 20,
                  ),
                  onTap: () {},
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'R\$ 398,30',
                  style: TextStyles.black54_24w400Roboto,
                )
              ],
            ),
            Text(
              "No momento",
              style: TextStyles.grey14w500Roboto,
            ),
            Transactions(category: category, date: date, value: value),
            Transactions(category: category, date: date, value: value),
            Transactions(category: category, date: date, value: value),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
      ),
      elevation: 3,
    );
  }
}

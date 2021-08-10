import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool showBalance = true;
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
                  onTap: () {
                    setState(() {
                      showBalance = !showBalance;
                    });
                  },
                )
              ],
            ),
            Row(
              children: [
                Visibility(
                  visible: showBalance,
                  child:
                      Text('R\$ 3.000,00', style: TextStyles.black24w400Roboto),
                )
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

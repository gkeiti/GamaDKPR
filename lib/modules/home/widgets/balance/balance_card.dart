import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/balance/balance_controller.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/balance/dtd_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

import 'chart.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;
  @override
  _BalanceCardState createState() => _BalanceCardState(uid);
}

class _BalanceCardState extends State<BalanceCard> {
  String dropdownValue = 'AGO';
  String month = '8';
  List<String> months = [
    'JAN',
    'FEV',
    'MAR',
    'ABR',
    'MAI',
    'JUN',
    'JUL',
    'AGO',
    'SET',
    'OUT',
    'NOV',
    'DEZ'
  ];
  final String uid;
  late BalanceCardController controller;

  _BalanceCardState(this.uid) {
    controller = BalanceCardController(uid, month, HomeRepositoryImpl());
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
                Text("Dia a dia", style: TextStyles.purple20w500Roboto),
                Container(
                  height: 32,
                  width: 74,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[AppColors.cyan, AppColors.purple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.1, 0.7],
                      transform: GradientRotation((38 * 3.141592) / 180),
                    ),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: DropdownButton(
                    value: dropdownValue,
                    dropdownColor: AppColors.purple,
                    menuMaxHeight: 400,
                    underline: Container(color: Colors.black),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        month = (months.indexOf(dropdownValue) + 1).toString();
                        controller.getBalance(uid, month);
                      });
                    },
                    items: months.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyles.white14w500Roboto),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            Observer(builder: (_) {
              List<DtdModel> balance = controller.balance!.data;
              // ignore: unnecessary_null_comparison
              if (controller.balance!.status == null) {
                return CircularProgressIndicator();
              }
              if (balance.isEmpty) {
                return Row(
                  children: [
                    Text("Sem cadastros", style: TextStyles.black24w400Roboto),
                  ],
                );
              } else {
                if (balance[0].entrance == 0.0) {
                  return Row(
                    children: [
                      Text(
                        'R\$' +
                            ((0 - balance[0].out) / 100)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: TextStyles.black24w400Roboto,
                      )
                    ],
                  );
                } else if (balance[0].out == 0.0) {
                  return Row(
                    children: [
                      Text(
                        'R\$' +
                            ((balance[0].entrance - 0) / 100)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: TextStyles.black24w400Roboto,
                      )
                    ],
                  );
                } else {
                  return Row(
                    children: [
                      Text(
                        'R\$' +
                            ((balance[0].entrance - balance[0].out) / 100)
                                .toStringAsFixed(2)
                                .replaceAll('.', ','),
                        style: TextStyles.black24w400Roboto,
                      )
                    ],
                  );
                }
              }
            }),
            SizedBox(height: 16.0),
            Observer(builder: (_) {
              List<DtdModel> balance = controller.balance!.data;
              if (balance.isEmpty) {
                return Row(
                  children: [
                    Text('Inserir mais dados para gerar gráfico'),
                  ],
                );
              } else {
                if (balance[0].entrance == 0.0 || balance[0].out == 0.0) {
                  return Text("Gráfico");
                } else {
                  return Chart(
                    entrance: balance[0].entrance,
                    out: balance[0].out,
                  );
                }
              }
            }),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      elevation: 3,
    );
  }
}

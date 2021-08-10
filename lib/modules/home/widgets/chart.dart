import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final int entrada = 10000;
  final int saida = 50000;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.79,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Saídas", style: TextStyles.black14w500Roboto),
                          SizedBox(width: 1),
                          Text('R\$ $saida',
                              style: TextStyles.black14w400Roboto),
                        ],
                      ),
                      Container(
                        height: 11,
                        width: entrada <= saida
                            ? MediaQuery.of(context).size.width * 0.79
                            : (MediaQuery.of(context).size.width * 0.79) *
                                saida /
                                entrada,
                        decoration: BoxDecoration(
                          color: AppColors.cyan,
                          borderRadius: BorderRadius.circular(360),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.79,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Entradas", style: TextStyles.black14w500Roboto),
                          SizedBox(width: 1),
                          Text('R\$ $entrada',
                              style: TextStyles.black14w400Roboto),
                        ],
                      ),
                      Container(
                        height: 11,
                        width: entrada >= saida
                            ? MediaQuery.of(context).size.width * 0.79
                            : (MediaQuery.of(context).size.width * 0.79) *
                                entrada /
                                saida,
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(360),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

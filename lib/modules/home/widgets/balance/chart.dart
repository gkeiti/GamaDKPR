import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key, required this.entrance, required this.out})
      : super(key: key);
  final double entrance;
  final double out;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
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
                          Text('R\$ ' + (widget.out / 100).toStringAsFixed(2),
                              style: TextStyles.black14w400Roboto),
                        ],
                      ),
                      Container(
                        height: 11,
                        width: widget.entrance <= widget.out
                            ? MediaQuery.of(context).size.width * 0.79
                            : (MediaQuery.of(context).size.width * 0.79) *
                                widget.out /
                                widget.entrance,
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
                          Text(
                              'R\$ ' +
                                  (widget.entrance / 100).toStringAsFixed(2),
                              style: TextStyles.black14w400Roboto),
                        ],
                      ),
                      Container(
                        height: 11,
                        width: widget.entrance >= widget.out
                            ? MediaQuery.of(context).size.width * 0.79
                            : (MediaQuery.of(context).size.width * 0.79) *
                                widget.entrance /
                                widget.out,
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

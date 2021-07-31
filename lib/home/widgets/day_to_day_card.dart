import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/home/widgets/chart.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class DayToDayCard extends StatefulWidget {
  const DayToDayCard({
    Key? key,
  }) : super(key: key);

  @override
  _DayToDayCardState createState() => _DayToDayCardState();
}

class _DayToDayCardState extends State<DayToDayCard> {
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
                Text(
                  "Dia a dia",
                  style: TextStyles.purple20w500Roboto,
                ),
                Container(
                  height: 32,
                  width: 74,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.cyan,
                        AppColors.purple,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0.1,
                        0.7,
                      ],
                      transform: GradientRotation((38 * 3.141592) / 180),
                    ),
                    borderRadius: BorderRadius.circular(34),
                  ),
                  child: DropdownButton(
                    value: 'AGO',
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    items: ['AGO'].map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyles.white14w500Roboto,
                          ),
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'R\$ 3.000,00',
                  style: TextStyles.black24w400Roboto,
                )
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Chart(),
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
    required this.category,
    required this.date,
    required this.value,
  }) : super(key: key);

  final String category;
  final String date;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: AppColors.yellow,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.none,
                        image: AssetImage('assets/logos/food.png'),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: TextStyles.purple16w500Roboto,
                    ),
                    Text(
                      date,
                      style: TextStyles.grey14w400Roboto,
                    )
                  ],
                ),
              ],
            ),
          ),
          Text(
            "-R\$ ${value.toStringAsFixed(2)}",
            style: TextStyles.black87_16w400Roboto,
          ),
        ],
      ),
    );
  }
}

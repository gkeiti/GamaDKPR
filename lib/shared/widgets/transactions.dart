import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class Transactions extends StatelessWidget {
  const Transactions({
    Key? key,
    required this.category,
    required this.date,
    required this.value,
    required this.url,
    required this.backgroundColor,
  }) : super(key: key);

  final String category;
  final String date;
  final double value;
  final String url;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 64.0,
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
                        color: backgroundColor,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(url)),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category, style: TextStyles.purple16w500Roboto),
                      Text(date, style: TextStyles.grey14w400Roboto)
                    ],
                  ),
                ],
              ),
            ),
            Text("R\$ ${value.toStringAsFixed(2)}",
                style: TextStyles.black87_16w400Roboto),
          ],
        ),
      ),
    );
  }
}

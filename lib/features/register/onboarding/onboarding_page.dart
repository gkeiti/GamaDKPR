import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              "assets/images/background_image_1_5x.png",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Positioned(
            left: 93.0,
            top: 195.0,
            child: Container(
              child: Image.asset(
                "assets/images/vector_logo_1x.png",
              ),
            ),
          ),
          Positioned(
            left: 45.0,
            right: 49.0,
            top: 330.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                Text(
                  "Agora sim! \nVocê terá o \ncontrole \nfinanceiro nas \nsuas mãos!",
                  style: TextStyles.cyan34w700Roboto,
                ),
              ],
            ),
          ),
          Positioned(
            left: 45.0,
            bottom: 40.0,
            child: MaterialButton(
              onPressed: () {},
              child: Text(
                "VAMOS LÁ!",
                style: TextStyles.continueButton,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34.0),
              ),
              color: AppColors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}

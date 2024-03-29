import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class ErrorHomePage extends StatelessWidget {
  const ErrorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.cyan, AppColors.purple],
              stops: [0.05, 0.6],
              transform: GradientRotation((45 * 3.1415) / 180),
            ),
          ),
        ),
      ),
      drawer: SideDrawer(
        user: null,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'Erro de conexão',
                  style: TextStyles.cyan48w400Roboto,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 178,
                height: 36,
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
                child: MaterialButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login_password');
                  },
                  child: Row(
                    children: [
                      Flexible(
                        child: Text("TENTAR NOVAMENTE",
                            style: TextStyles.continueButton),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

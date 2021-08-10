import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';

class UpdateRegisterScreen extends StatefulWidget {
  const UpdateRegisterScreen({Key? key}) : super(key: key);

  @override
  _UpdateRegisterScreenState createState() => _UpdateRegisterScreenState();
}

class _UpdateRegisterScreenState extends State<UpdateRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExtendedGradientContainer(pageTitle: 'Cadastro'),
            Container(
              height: 395,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      children: [
                        //Substituir os TextField pelos customizados
                        TextField(
                          decoration: InputDecoration(labelText: 'Nome'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'CPF'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'E-mail'),
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Celular'),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          width: 192,
          height: 50,
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
            onPressed: null,
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text("SALVAR ALTERAÇÕES",
                            style: TextStyles.white14w500Roboto),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            disabledColor: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(34)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:trabalho_final_dgpr/modules/home/home_controller.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';

class UpdateRegisterScreen extends StatefulWidget {
  const UpdateRegisterScreen({Key? key}) : super(key: key);

  @override
  _UpdateRegisterScreenState createState() => _UpdateRegisterScreenState();
}

class _UpdateRegisterScreenState extends State<UpdateRegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController cpfController =
      MaskedTextController(mask: '000.000.000-00');
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController =
      MaskedTextController(mask: "(00)00000-0000");
  final HomeController controller = HomeController();
  final Validator validator = Validator();
  UserData? user;

  @override
  void dispose() {
    nameController.dispose();
    cpfController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserData? arguments =
        ModalRoute.of(context)!.settings.arguments as UserData?;
    if (arguments != null) {
      user = arguments;
      nameController.text = user!.name;
      cpfController.text = user!.cpf;
      emailController.text = user!.email;
      phoneController.text = user!.phone;
    }
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
            Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Container(
                  height: 395,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Column(
                          children: [
                            InputText(
                              controller: nameController,
                              textInputAction: TextInputAction.next,
                              label: 'Nome',
                              textInputType: TextInputType.name,
                              validator: (value) =>
                                  validator.validatorName(value!),
                            ),
                            InputText(
                              controller: cpfController,
                              textInputAction: TextInputAction.next,
                              label: 'CPF',
                              textInputType: TextInputType.number,
                              validator: (value) =>
                                  validator.isCpfValid(value!),
                            ),
                            InputText(
                              controller: emailController,
                              textInputAction: TextInputAction.next,
                              label: 'E-mail',
                              textInputType: TextInputType.emailAddress,
                              validator: (value) =>
                                  validator.isEmailValid(value!),
                            ),
                            InputText(
                              textInputAction: TextInputAction.done,
                              controller: phoneController,
                              label: 'Telefone',
                              textInputType: TextInputType.phone,
                              validator: (value) =>
                                  validator.isPhoneValid(value!),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await controller.repository.updateRegister(
                  UserData(
                      email: emailController.text,
                      cpf: cpfController.text,
                      uid: user!.uid,
                      phone: phoneController.text,
                      name: nameController.text),
                );
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
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

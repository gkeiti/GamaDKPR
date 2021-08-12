import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/validators.dart';
import 'package:trabalho_final_dgpr/shared/widgets/appbar_white.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'package:trabalho_final_dgpr/shared/widgets/logo_budget_2_1.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';

class RegisterPhoneCpfPage extends StatefulWidget {
  const RegisterPhoneCpfPage({Key? key}) : super(key: key);

  @override
  _RegisterPhoneCpfPageState createState() => _RegisterPhoneCpfPageState();
}

class _RegisterPhoneCpfPageState extends State<RegisterPhoneCpfPage> {
  MaskedTextController _phoneController =
      MaskedTextController(mask: "(00)00000-0000");
  MaskedTextController _cpfController =
      MaskedTextController(mask: "000.000.000-00");
  FocusNode _myFocusNode = FocusNode();

  final GlobalKey<FormState>? phoneCpfKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();
  final phone = TextEditingController();
  final cpf = TextEditingController();

  registrar() async {
    try {
      await context.read<AuthService>().registrar(phone.text, cpf.text);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    }
  }

  Validators validators = Validators();

  String phone_validate = "";
  String cpf_validate = "";

  @override
  void initState() {
    _myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _myFocusNode.dispose();
    _phoneController.dispose();
    _cpfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWhiteWidget(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(children: [
            Positioned(
              top: 0.0,
              left: 48.0,
              child: LogoBudgetWidget(),
            ),
            Positioned(
              top: 70.0,
              left: 48.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return InputText(
                      textInputAction: TextInputAction.next,
                      controller: _phoneController,
                      onChanged: (value) => validators.setPhone(value!),
                      label: 'Telefone',
                      textInputType: TextInputType.phone,
                      validator: (value) => validators.isPhoneValid(),
                      onSaved: (String? value) {
                        phone_validate = value!;
                      },
                    );
                  }),
                  SizedBox(height: 32.0),
                  Observer(builder: (_) {
                    return InputText(
                      focusNode: _myFocusNode,
                      textInputAction: TextInputAction.done,
                      controller: _cpfController,
                      onChanged: (value) => validators.setCpf(value!),
                      label: 'CPF',
                      helperText:
                          "O CPF é necessário para conectar suas contas.",
                      textInputType: TextInputType.number,
                      validator: (value) => validators.isCpfValid(),
                      onSaved: (String? value) {
                        cpf_validate = value!;
                      },
                    );
                  })
                ],
              ),
            ),
          ]
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(16, 650, 16, 0.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       BackButtonWidget(
              //         onPressed: () {
              //           Navigator.pop(context);
              //         },
              //       ),
              //       ContinueForwardButton(
              //         onPressed: () {
              //           if (phoneCpfKey.currentState!.validate()) {
              //             Navigator.pushNamed(context, "/register_terms");
              //           }
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              ),
        ),
      ),
    );
  }
}

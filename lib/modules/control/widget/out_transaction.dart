import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trabalho_final_dgpr/modules/control/control_controller.dart';
import 'package:trabalho_final_dgpr/modules/control/model/balance_model.dart';
import 'package:trabalho_final_dgpr/modules/control/model/transactions_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/input_text.dart';
import 'insert_button.dart';

// ignore: must_be_immutable
class OutTransactionCard extends StatefulWidget {
  OutTransactionCard(
      {Key? key,
      required this.controller,
      required this.valueController,
      required this.dropdownOutValue,
      required this.transactionNameController,
      required this.uid})
      : super(key: key);
  ControlController controller;
  TextEditingController valueController;
  String dropdownOutValue;
  TextEditingController transactionNameController;
  String uid;

  @override
  _OutTransactionCardState createState() => _OutTransactionCardState();
}

class _OutTransactionCardState extends State<OutTransactionCard> {
  final focusNode = FocusNode();
  final List<String> dropdownItems = [
    'Educação',
    'Refeição',
    'Transporte',
    'Viagem',
    'Pagamentos',
    'Outros'
  ];
  DateTime dateTime = DateTime.now();
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 395,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 20.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(35.0, 10, 35.0, 0),
                        child: Column(
                          children: [
                            Text('Saída', style: TextStyles.purple20w500Roboto),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: InputText(
                                label: 'Valor',
                                prefix: Text('R\$'),
                                maxLength: 8,
                                maxLines: 1,
                                controller: widget.valueController,
                                textInputType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                            InputDecorator(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.black54, width: 2.0),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: widget.dropdownOutValue,
                                  menuMaxHeight: 250,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      widget.dropdownOutValue = newValue!;
                                    });
                                  },
                                  items: dropdownItems.map(
                                    (e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Row(
                                          children: [
                                            Text(e,
                                                style: TextStyles
                                                    .black54_16w400Roboto),
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: InputText(
                                label: 'Nome da Saída',
                                maxLength: 10,
                                maxLines: 1,
                                controller: widget.transactionNameController,
                                textInputAction: TextInputAction.done,
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2020),
                                          lastDate: DateTime(2022))
                                      .then((date) {
                                    setState(() {
                                      dateTime = date!;
                                    });
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: Text(
                                        DateFormat('dd/MM/yyyy')
                                            .format(dateTime),
                                        style: TextStyles.purple14w500Roboto,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                InsertButton(
                    onPressed: () async {
                      try {
                        await widget.controller.repository.addTransaction(
                          TransactionsModel(
                              category: widget.dropdownOutValue,
                              value: double.parse(widget.valueController.text
                                      .replaceAll(',', '.')) *
                                  100,
                              uid: widget.uid,
                              date: DateFormat('dd/MM/yyyy')
                                  .format(dateTime)
                                  .toString(),
                              type: 'out',
                              month: DateFormat('M').format(dateTime),
                              name: widget.transactionNameController.text),
                        );
                        await widget.controller.repository.addBalance(
                          BalanceModel(
                            entrance: double.parse(widget.valueController.text
                                    .replaceAll(',', '.')) *
                                0,
                            out: double.parse(widget.valueController.text
                                    .replaceAll(',', '.')) *
                                100,
                            uid: widget.uid,
                            month: DateFormat('M').format(dateTime),
                            type: 'out',
                          ),
                        );
                        await widget.controller.repository.addBudget(
                            widget.uid,
                            double.parse(widget.valueController.text
                                    .replaceAll(',', '.')) *
                                -100);
                        widget.valueController.clear();
                        widget.transactionNameController.clear();
                        Navigator.pop(context);
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Erro ao realizar a ação',
                                style: TextStyles.black24w400Roboto,
                              ),
                              content: Text(
                                'Tente novamente mais tarde',
                                style: TextStyles.black14w400Roboto,
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            );
                          },
                        );
                      }
                    },
                    buttonEnabled: double.tryParse(widget.valueController.text
                                .replaceAll(',', '.')) !=
                            null
                        ? true
                        : false)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

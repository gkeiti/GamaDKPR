import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trabalho_final_dgpr/modules/control/control_controller.dart';
import 'package:trabalho_final_dgpr/modules/control/model/balance_model.dart';
import 'package:trabalho_final_dgpr/modules/control/model/transactions_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

import 'insert_button.dart';

// ignore: must_be_immutable
class InTransactionCard extends StatefulWidget {
  InTransactionCard(
      {Key? key,
      required this.controller,
      required this.valueController,
      required this.dropdownInValue,
      required this.transactionNameController,
      required this.uid})
      : super(key: key);
  ControlController controller;
  TextEditingController valueController;
  String dropdownInValue;
  TextEditingController transactionNameController;
  String uid;

  @override
  _InTransactionCardState createState() => _InTransactionCardState();
}

class _InTransactionCardState extends State<InTransactionCard> {
  final focusNode = FocusNode();
  final List<String> dropdownItems = [
    'Dinheiro',
    'PIX',
    'DOC',
    'TED',
    'Boleto',
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
                            Text('Entrada',
                                style: TextStyles.purple20w500Roboto),
                            //Substituir os TextField pelos customizados
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: TextField(
                                controller: widget.valueController,
                                decoration:
                                    InputDecoration(labelText: 'Valor em R\$'),
                                style: TextStyles.black54_16w400Roboto,
                              ),
                            ),
                            InputDecorator(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  value: widget.dropdownInValue,
                                  menuMaxHeight: 250,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      widget.dropdownInValue = newValue!;
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
                              child: TextField(
                                controller: widget.transactionNameController,
                                decoration: InputDecoration(
                                  labelText: 'Nome da Entrada',
                                ),
                              ),
                            ),
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2050))
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
                    onPressed: () {
                      widget.controller.repository.addTransaction(
                        TransactionsModel(
                            category: widget.dropdownInValue,
                            value:
                                double.parse(widget.valueController.text) * 100,
                            uid: widget.uid,
                            date: DateFormat('dd/MM/yyyy')
                                .format(dateTime)
                                .toString(),
                            type: 'in',
                            month: DateFormat('M').format(dateTime),
                            name: widget.transactionNameController.text),
                      );
                      widget.controller.repository.addBalance(
                        BalanceModel(
                          entrance:
                              double.parse(widget.valueController.text) * 100,
                          out: double.parse(widget.valueController.text) * 0,
                          uid: widget.uid,
                          month: DateFormat('M').format(dateTime),
                          type: 'in',
                        ),
                      );
                      widget.controller.repository.addBudget(widget.uid,
                          double.parse(widget.valueController.text) * 100);
                      widget.valueController.clear();
                      widget.transactionNameController.clear();
                      throw ('Erro');
                    },
                    buttonEnabled:
                        double.tryParse(widget.valueController.text) != null
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

import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/insert_button.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:intl/intl.dart';

class InTransaction extends StatefulWidget {
  const InTransaction({Key? key}) : super(key: key);

  @override
  _InTransactionState createState() => _InTransactionState();
}

class _InTransactionState extends State<InTransaction> {
  DateTime dateTime = DateTime.now();
  String dropdownValue = '';

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
            ExtendedGradientContainer(pageTitle: 'Entrada'),
            Container(
              height: 395,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 16.0,
                  right: 16.0,
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      children: [
                        //Substituir os TextField pelos customizados
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Valor em R\$',
                            ),
                            style: TextStyles.black54_16w400Roboto,
                          ),
                        ),
                        InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: 'Dinheiro',
                              menuMaxHeight: 250,
                              underline: Container(
                                color: Colors.black,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: [
                                'Dinheiro',
                                'PIX',
                                'DOC',
                                'TED',
                                'Boleto',
                              ].map(
                                (e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            gradient: AppColors.linearGradient,
                                          ),
                                        ),
                                        Text(
                                          e,
                                          style:
                                              TextStyles.black54_16w400Roboto,
                                        ),
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
                            decoration: InputDecoration(
                              labelText: 'Nome da Entrada',
                            ),
                          ),
                        ),
                        calendar(context)
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InsertButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container calendar(BuildContext context) {
    return Container(
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
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                DateFormat('d/M/y').format(dateTime),
                style: TextStyles.purple14w500Roboto,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:trabalho_final_dgpr/modules/control/control_controller.dart';
import 'package:trabalho_final_dgpr/modules/control/model/all_transactions_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/add_button.dart';

class AllInTransactionsCard extends StatefulWidget {
  const AllInTransactionsCard({
    Key? key,
    required this.controller,
    required this.user,
    required this.month,
  }) : super(key: key);
  final ControlController controller;
  final UserData? user;
  final String month;

  @override
  _AllInTransactionsCardState createState() => _AllInTransactionsCardState();
}

class _AllInTransactionsCardState extends State<AllInTransactionsCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Card(
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Column(
                        children: [
                          Expanded(
                            child: StreamBuilder(
                              stream: widget.controller.repository.transactions
                                  .where('uid', isEqualTo: widget.user!.uid)
                                  .where('month',
                                      isEqualTo: widget.month.toString())
                                  .where('type', isEqualTo: 'in')
                                  .orderBy('date', descending: true)
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return ListView(
                                  padding: EdgeInsets.all(0),
                                  children: widget.controller.repository
                                      .getAllTransactions(snapshot),
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 57.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total de entradas',
                                  style: TextStyles.purple16w500Roboto,
                                ),
                                Observer(
                                  builder: (_) {
                                    List<AllTransactionsModel>? total =
                                        widget.controller.allTransactions!.data;
                                    if (total == null) {
                                      return CircularProgressIndicator();
                                    }
                                    if (total.isEmpty) {
                                      return Text('R\$ 0,00',
                                          style: TextStyles.green14w500Roboto);
                                    } else {
                                      return Text(
                                          'R\$ ' +
                                              (total[0].entrance / 100)
                                                  .toStringAsFixed(2)
                                                  .replaceAll('.', ','),
                                          style: TextStyles.green14w500Roboto);
                                    }
                                  },
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: AppColors.drawerItemBorder),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddButton(
        user: widget.user,
        initialPage: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

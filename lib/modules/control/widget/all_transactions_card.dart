import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/modules/control/model/all_transactions_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

import '../control_controller.dart';

class AllTransactionsCard extends StatefulWidget {
  const AllTransactionsCard({
    Key? key,
    required this.controller,
    required this.uid,
    required this.month,
  }) : super(key: key);
  final ControlController controller;
  final String uid;
  final String month;
  @override
  _AllTransactionsCardState createState() => _AllTransactionsCardState();
}

class _AllTransactionsCardState extends State<AllTransactionsCard> {
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
                                  .where('uid', isEqualTo: widget.uid)
                                  .where('month',
                                      isEqualTo: widget.month.toString())
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
                                  'Total',
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
                                          style: TextStyles.grey14w500Roboto);
                                    } else {
                                      return Text(
                                          'R\$ ' +
                                              (total[0].total / 100)
                                                  .toStringAsFixed(2)
                                                  .replaceAll('.', ','),
                                          style: TextStyles.grey14w500Roboto);
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
    );
  }
}

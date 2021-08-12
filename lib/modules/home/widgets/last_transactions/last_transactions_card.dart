import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/last_transactions/last_transactions_controller.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class LastTransactionsCard extends StatefulWidget {
  const LastTransactionsCard({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;
  @override
  _LastTransactionsCardState createState() => _LastTransactionsCardState(uid);
}

class _LastTransactionsCardState extends State<LastTransactionsCard> {
  final String uid;
  late LastTransactionsController controller;
  Timer? timer;

  _LastTransactionsCardState(this.uid) {
    controller = LastTransactionsController(HomeRepositoryImpl(), uid);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => controller.getTotal(uid));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 315,
            child: Card(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Últimas transações",
                              style: TextStyles.purple20w500Roboto),
                          GestureDetector(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.purple,
                              size: 20,
                            ),
                            onTap: () {},
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Observer(
                            builder: (_) {
                              if (controller.total!.isEmpty) {
                                return Text("data");
                              }
                              return Text(
                                  'R\$ ${controller.total!.replaceAll('.', ',')}',
                                  style: TextStyles.black54_24w400Roboto);
                            },
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text("No momento",
                              style: TextStyles.grey14w500Roboto),
                        ],
                      ),
                      Flexible(
                        child: StreamBuilder(
                          stream: controller.repository.transactions
                              .limit(3)
                              .where('uid', isEqualTo: uid)
                              .orderBy('createdAt', descending: true)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView(
                              children:
                                  controller.repository.getItems(snapshot),
                            );
                          },
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
        ],
      ),
    );
  }
}

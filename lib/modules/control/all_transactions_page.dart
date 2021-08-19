import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/modules/control/control_repository.dart';
import 'package:trabalho_final_dgpr/modules/control/model/all_transactions_model.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

import 'control_controller.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  _AllTransactionsPageState createState() => _AllTransactionsPageState(uid);
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Entradas'),
    Tab(text: 'Saídas'),
    Tab(text: 'Todas'),
  ];
  String dropdownValue = 'AGOSTO';
  List<String> months = [
    'JANEIRO',
    'FEVEREIRO',
    'MARÇO',
    'ABRIL',
    'MAIO',
    'JUNHO',
    'JULHO',
    'AGOSTO',
    'SETEMBRO',
    'OUTUBRO',
    'NOVEMBRO',
    'DEZEMBRO'
  ];
  String month = '8';
  late ControlController controller;
  final String uid;

  _AllTransactionsPageState(this.uid) {
    controller = ControlController(uid, month, ControlRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              DropdownButton(
                value: dropdownValue,
                dropdownColor: AppColors.blue,
                menuMaxHeight: 400,
                underline: Container(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    month = (months.indexOf(dropdownValue) + 1).toString();
                    controller.getAllTransactionsValue(uid, month);
                  });
                },
                items: months.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                        width: 90,
                        child: Text(
                          e,
                          style: TextStyles.white14w500Roboto,
                          textAlign: TextAlign.right,
                        )),
                  );
                }).toList(),
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          drawer: SideDrawer(),
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ExtendedGradientContainer(pageTitle: 'Transações'),
                  TabBar(
                    indicatorColor: Colors.white,
                    indicatorWeight: 4.0,
                    labelStyle: TextStyles.white16w500Roboto,
                    tabs: myTabs,
                  )
                ],
              ),
              Expanded(
                child: Container(
                  child: TabBarView(children: [
                    allInTransactions(),
                    allOutTransactions(),
                    allTransactions()
                  ]),
                ),
              )
            ],
          ),
          /* floatingActionButton: AddButton(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat, */
        ),
      ),
    );
  }

  Container allTransactions() {
    return Container(
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
                            stream: controller.repository.transactions
                                .where('uid', isEqualTo: widget.uid)
                                .where('month', isEqualTo: month.toString())
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
                                children: controller.repository
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
                                      controller.allTransactions!.data;
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
                              bottom:
                                  BorderSide(color: AppColors.drawerItemBorder),
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
    );
  }

  Container allOutTransactions() {
    return Container(
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
                            stream: controller.repository.transactions
                                .where('uid', isEqualTo: widget.uid)
                                .where('month', isEqualTo: month.toString())
                                .where('type', isEqualTo: 'out')
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
                                children: controller.repository
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
                                'Total de saídas',
                                style: TextStyles.purple16w500Roboto,
                              ),
                              Observer(
                                builder: (_) {
                                  List<AllTransactionsModel>? total =
                                      controller.allTransactions!.data;
                                  if (total == null) {
                                    return CircularProgressIndicator();
                                  }
                                  if (total.isEmpty) {
                                    return Text('R\$ 0,00',
                                        style: TextStyles.red14w500Roboto);
                                  } else {
                                    return Text(
                                        'R\$ ' +
                                            (total[0].out / 100)
                                                .toStringAsFixed(2)
                                                .replaceAll('.', ','),
                                        style: TextStyles.red14w500Roboto);
                                  }
                                },
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom:
                                  BorderSide(color: AppColors.drawerItemBorder),
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
    );
  }

  Container allInTransactions() {
    return Container(
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
                            stream: controller.repository.transactions
                                .where('uid', isEqualTo: widget.uid)
                                .where('month', isEqualTo: month.toString())
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
                                children: controller.repository
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
                                      controller.allTransactions!.data;
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
                              bottom:
                                  BorderSide(color: AppColors.drawerItemBorder),
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
    );
  }
}

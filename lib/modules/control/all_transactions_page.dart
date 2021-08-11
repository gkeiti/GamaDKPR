import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/last_transactions/last_transactions_controller.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;

  @override
  _AllTransactionsPageState createState() => _AllTransactionsPageState();
}

class _AllTransactionsPageState extends State<AllTransactionsPage> {
  final controller = LastTransactionsController(HomeRepositoryImpl(), '123456');

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
  int month = 8;

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
                menuMaxHeight: 200,
                underline: Container(color: Colors.black),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    month = months.indexOf(dropdownValue) + 1;
                  });
                },
                items: months.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e, style: TextStyles.white14w500Roboto),
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
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 395,
                            child: Card(
                              child: Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: StreamBuilder(
                                          stream: controller
                                              .repository.transactions
                                              .where('uid',
                                                  isEqualTo: widget.uid)
                                              .where('month',
                                                  isEqualTo: month.toString())
                                              .where('type', isEqualTo: 'in')
                                              //.orderBy('date', descending: false)
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return ListView(
                                              padding: EdgeInsets.all(0),
                                              children: controller.repository
                                                  .getItems(snapshot),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 57.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total de entradas',
                                              style:
                                                  TextStyles.purple16w500Roboto,
                                            ),
                                            Observer(
                                              builder: (_) {
                                                return Text(
                                                    'R\$ ${controller.total!.replaceAll('.', ',')}',
                                                    style: TextStyles
                                                        .green14w500Roboto);
                                              },
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    AppColors.drawerItemBorder),
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
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 395,
                            child: Card(
                              child: Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: StreamBuilder(
                                          stream: controller
                                              .repository.transactions
                                              .limit(3)
                                              .where('uid',
                                                  isEqualTo: widget.uid)
                                              .where('month',
                                                  isEqualTo: month.toString())
                                              .where('type', isEqualTo: 'out')
                                              //.orderBy('date', descending: false)
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return ListView(
                                              padding: EdgeInsets.all(0),
                                              children: controller.repository
                                                  .getItems(snapshot),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 57.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total de saídas',
                                              style:
                                                  TextStyles.purple16w500Roboto,
                                            ),
                                            Observer(
                                              builder: (_) {
                                                return Text(
                                                    'R\$ ${controller.total!.replaceAll('.', ',')}',
                                                    style: TextStyles
                                                        .red14w500Roboto);
                                              },
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    AppColors.drawerItemBorder),
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
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            height: 395,
                            child: Card(
                              child: Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: StreamBuilder(
                                          stream: controller
                                              .repository.transactions
                                              .limit(3)
                                              .where('uid',
                                                  isEqualTo: widget.uid)
                                              .where('month',
                                                  isEqualTo: month.toString())
                                              //.orderBy('date', descending: false)
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<QuerySnapshot>
                                                  snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                            return ListView(
                                              padding: EdgeInsets.all(0),
                                              children: controller.repository
                                                  .getItems(snapshot),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        height: 57.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Total',
                                              style:
                                                  TextStyles.purple16w500Roboto,
                                            ),
                                            Observer(
                                              builder: (_) {
                                                return Text(
                                                    'R\$ ${controller.total!.replaceAll('.', ',')}',
                                                    style: TextStyles
                                                        .grey14w500Roboto);
                                              },
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color:
                                                    AppColors.drawerItemBorder),
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
                        ],
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/home/transactions_control'),
            child: Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}

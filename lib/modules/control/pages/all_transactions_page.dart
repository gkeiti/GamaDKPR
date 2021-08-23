import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/control/control_repository.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/all_in_transactions_card.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/all_out_transactions_card.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/all_transactions_card.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

import '../control_controller.dart';

class AllTransactionsPage extends StatefulWidget {
  const AllTransactionsPage({
    Key? key,
  }) : super(key: key);

  @override
  _AllTransactionsPageState createState() => _AllTransactionsPageState();
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
  UserData? user;
  @override
  Widget build(BuildContext context) {
    final UserData? arguments =
        ModalRoute.of(context)!.settings.arguments as UserData?;
    if (arguments != null) {
      user = arguments;
      String uid = user!.uid;
      controller = ControlController(uid, month, ControlRepositoryImpl());
    }
    return Scaffold(
      body: DefaultTabController(
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
                    controller.getAllTransactionsValue(user!.uid, month);
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
                    AllInTransactionsCard(
                      controller: controller,
                      user: user,
                      month: month,
                    ),
                    AllOutTransactionsCard(
                      controller: controller,
                      user: user,
                      month: month,
                    ),
                    AllTransactionsCard(
                      controller: controller,
                      uid: user!.uid,
                      month: month,
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

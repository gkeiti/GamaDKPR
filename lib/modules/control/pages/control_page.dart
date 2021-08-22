import 'package:flutter/material.dart';

import 'package:trabalho_final_dgpr/modules/control/control_controller.dart';
import 'package:trabalho_final_dgpr/modules/control/control_repository.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/in_transaction.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/out_transaction.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class TransactionsControl extends StatefulWidget {
  const TransactionsControl({
    Key? key,
  }) : super(key: key);

  @override
  _TransactionsControlState createState() => _TransactionsControlState();
}

class _TransactionsControlState extends State<TransactionsControl> {
  DateTime dateTime = DateTime.now();
  TextEditingController valueController = TextEditingController();
  TextEditingController transactionNameController = TextEditingController();
  UserData? user;

  late ControlController controller;

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Entrada'),
    Tab(text: 'Saída'),
  ];

  @override
  void dispose() {
    valueController.dispose();
    transactionNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments['user'] != null) {
      user = arguments['user'];
      controller = ControlController(user!.uid, '8', ControlRepositoryImpl());
    }
    int initialPage = arguments['initialPage'];
    return Scaffold(
      body: DefaultTabController(
        initialIndex: initialPage,
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          drawer: SideDrawer(user: user),
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ExtendedGradientContainer(pageTitle: 'Controle'),
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
                  child: TabBarView(
                    children: [
                      InTransactionCard(
                        controller: controller,
                        valueController: valueController,
                        dropdownInValue: 'Dinheiro',
                        transactionNameController: transactionNameController,
                        user: user,
                      ),
                      OutTransactionCard(
                        controller: controller,
                        valueController: valueController,
                        //dateTime: dateTime,
                        dropdownOutValue: 'Educação',
                        transactionNameController: transactionNameController,
                        uid: user!.uid,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/control/control_controller.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/in_transaction.dart';
import 'package:trabalho_final_dgpr/modules/control/widget/out_transaction.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/extended_gradient_container.dart';
import 'package:trabalho_final_dgpr/shared/widgets/side_drawer.dart';

class TransactionsControl extends StatefulWidget {
  const TransactionsControl({Key? key}) : super(key: key);

  @override
  _TransactionsControlState createState() => _TransactionsControlState();
}

class _TransactionsControlState extends State<TransactionsControl> {
  final controller = ControlController();
  DateTime dateTime = DateTime.now();
  TextEditingController valueController = TextEditingController();
  TextEditingController transactionNameController = TextEditingController();

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
    return MaterialApp(
      home: DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          drawer: SideDrawer(),
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
                      ),
                      OutTransactionCard(
                        controller: controller,
                        valueController: valueController,
                        //dateTime: dateTime,
                        dropdownOutValue: 'Educação',
                        transactionNameController: transactionNameController,
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

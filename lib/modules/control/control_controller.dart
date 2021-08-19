import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/modules/control/control_repository.dart';

import 'model/all_transactions_model.dart';

part 'control_controller.g.dart';

class ControlController = _ControlControllerBase with _$ControlController;

abstract class _ControlControllerBase with Store {
  final String uid;
  final String? month;
  final ControlRepositoryImpl repository;

  @observable
  ObservableStream<List<AllTransactionsModel>>? allTransactions;

  _ControlControllerBase(this.uid, this.month, this.repository) {
    getAllTransactionsValue(uid, month!);
  }

  @action
  getAllTransactionsValue(String uid, String month) {
    allTransactions =
        repository.getAllTransactionsValue(uid, month).asObservable();
  }
}

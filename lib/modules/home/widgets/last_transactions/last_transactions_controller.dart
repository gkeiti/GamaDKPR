import 'package:mobx/mobx.dart';

import '../../home_repository.dart';
import 'last_transactions_model.dart';

part 'last_transactions_controller.g.dart';

class LastTransactionsController = _LastTransactionsControllerBase
    with _$LastTransactionsController;

abstract class _LastTransactionsControllerBase with Store {
  final HomeRepositoryImpl repository;
  final String uid;

  _LastTransactionsControllerBase(
    this.repository,
    this.uid,
  ) {
    getLastTransactionsTotal(uid);
  }
  @observable
  double? total;

  @observable
  ObservableStream<List<LastTransactionsModel>>? lastTransactionsTotal;

  @action
  getLastTransactionsTotal(String uid) {
    total = 0;
    lastTransactionsTotal =
        repository.getLastTransactionsTotal(uid).asObservable();
  }
}

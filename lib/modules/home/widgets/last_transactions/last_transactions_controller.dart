import 'package:mobx/mobx.dart';

import '../../home_repository.dart';

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
    getTotal(uid);
  }

  @observable
  String? total;

  @observable
  ObservableFuture<String>? repositoryCall;

  @action
  Future<void> getTotal(String uid) async {
    repositoryCall = ObservableFuture(repository.getTotal(uid));
    total = (await repositoryCall)!;
  }
}

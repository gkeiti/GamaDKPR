import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';
import 'package:trabalho_final_dgpr/modules/home/widgets/balance/dtd_model.dart';
part 'balance_controller.g.dart';

class BalanceCardController = _BalanceCardControllerBase
    with _$BalanceCardController;

abstract class _BalanceCardControllerBase with Store {
  final String uid;
  final String month;
  final HomeRepositoryImpl repository;

  @observable
  ObservableStream<List<DtdModel>>? balance;

  _BalanceCardControllerBase(this.uid, this.month, this.repository) {
    getBalance(uid, month);
  }

  @action
  getBalance(String uid, String month) {
    balance = repository.getBalance(uid, month).asObservable();
  }
}

import 'package:mobx/mobx.dart';

import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';

import 'budget_model.dart';

part 'budget_controller.g.dart';

class BudgetCardController = _BudgetCardControllerBase
    with _$BudgetCardController;

abstract class _BudgetCardControllerBase with Store {
  final HomeRepositoryImpl repository;
  final String uid;

  @observable
  bool visible = true;

  @action
  changeVisibility() {
    visible = !visible;
  }

  @observable
  ObservableStream<List<BudgetModel>>? budget;

  _BudgetCardControllerBase(this.repository, this.uid) {
    getBudget(uid);
  }

  @action
  getBudget(String uid) {
    budget = repository.getBudget(uid).asObservable();
  }
}

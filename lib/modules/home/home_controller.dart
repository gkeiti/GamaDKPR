/* import 'package:mobx/mobx.dart';

import 'package:trabalho_final_dgpr/modules/home/home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepositoryImpl repository;
  _HomeControllerBase({
    required this.repository,
  }) {
    getTotal();
  }
  @observable
  String? total;

  @observable
  ObservableFuture<String>? repositoryCall;

  @action
  Future<void> getTotal() async {
    repositoryCall = ObservableFuture(repository.getTotal());
    total = (await repositoryCall)!;
  }
}

/* 
class HomeController {
  final repository = HomeRepositoryImpl();
} */
 */
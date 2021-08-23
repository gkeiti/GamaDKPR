import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/modules/login/login_repository.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepositoryImpl repository;
  _LoginControllerBase({
    required this.repository,
  });
}

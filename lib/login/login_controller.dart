import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/login/login_state.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthService authService;

  _LoginControllerBase(this.authService);

  void login(String email, String senha) async {
    try {
      update(LoginStateLoading());
      await authService.login(email, senha);
      update(LoginStateSucess());
    } catch (e) {
      update(
        LoginStateError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  @observable
  LoginState state = LoginStateEmpty();

  @action
  void update(LoginState _state) {
    state = _state;
  }
}

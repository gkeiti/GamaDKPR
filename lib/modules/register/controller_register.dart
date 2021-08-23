import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/modules/register/register_state.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
part 'controller_register.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final AuthService authService;

  _RegisterControllerBase(this.authService);

  @observable
  RegisterState state = RegisterStateEmpty();

  @action
  void update(RegisterState _state) {
    state = _state;
  }
}

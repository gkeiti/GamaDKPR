import 'package:mobx/mobx.dart';
import 'package:trabalho_final_dgpr/features/register/register_state.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
part 'controller_register.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final AuthService authService;

  _RegisterControllerBase(this.authService);

  // void registrar(String email, String nome) async {
  //   try {
  //     update(RegisterStateLoading());
  //     await authService.registrar(email, nome);
  //     update(RegisterStateSucess());
  //   } catch (e) {
  //     update(
  //       RegisterStateError(
  //         errorMessage: e.toString(),
  //       ),
  //     );
  //   }
  // }

  @observable
  RegisterState state = RegisterStateEmpty();

  @action
  void update(RegisterState _state) {
    state = _state;
  }
}

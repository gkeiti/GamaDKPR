import 'package:trabalho_final_dgpr/features/user_repository.dart';

RegisterUser? user = RegisterUser();

class ValidateLogin {
  String? isEmailValidLogin(String email) {
    if (email.isEmpty) {
      return "Campo vazio";
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return "Insira um email válido";
    } else if (email != user!.email) {
      return 'Email incorreto';
    } else
      return null;
  }

  String? isPasswordValidLogin(String password) {
    if (password.isEmpty) {
      return 'Campo vazio';
    } else if (password != user!.password) {
      return 'Senha incorreta';
    }
    return null;
  }
}

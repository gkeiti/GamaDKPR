import 'package:trabalho_final_dgpr/features/user_repository.dart';

RegisterUser? user = RegisterUser();

class Validator {
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

  String? validatorName(String name) {
    if (name.isEmpty) {
      return "Campo vazio, insira um nome válido";
    } else if (!RegExp(r"^[A-Z a-z]{3,16}$").hasMatch(name)) {
      return "Insira um nome válido!";
    }
    return null;
  }

  String? isEmailValid(String email) {
    if (email.isEmpty) {
      return "Campo vazio, insira um email válido";
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return "Insira um email válido";
    }
    return null;
  }

  String? isPhoneValid(String phone) {
    if (phone.isEmpty) {
      return "Campo vazio, insira um telefone válido!";
    } else if (!RegExp(
            r'^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$')
        .hasMatch(phone)) {
      return "Insira um telefone válido!";
    }
    return null;
  }

  String? isCpfValid(String cpf) {
    if (cpf.isEmpty) {
      return "Campo vazio, insira um CPF válido!";
    } else if (!RegExp(r'^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$')
        .hasMatch(cpf)) {
      return "CPF válido ou incompleto!";
    }
    return null;
  }

  bool terms = false;

  bool isTermsValid(bool terms) {
    return terms = true;
  }

  String? isPasswordValid(String password) {
    if (password.length < 8)
      return "Insira uma senha com 8 ou mais caracteres!";
    if (!password.contains(RegExp(r"[a-z]")))
      return "Precisa ter pelo menos um caracter minúsculo";
    if (!password.contains(RegExp(r"[A-Z]")))
      return "Precisa ter pelo menos um caracter maiúsculo";
    if (!password.contains(RegExp(r"[0-9]")))
      return "Precisa ter pelo menos um número";
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
      return "A senha precisa ter pelo menos 1 caracter especial";
    return null;
  }

  String? setConfirmPassword(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return "Campo vazio, insira a senha!";
    } else if (confirmPassword != password) {
      return 'A senha não é igual!';
    }
    String aux = r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&~]).{8,}$';
    RegExp regExp = RegExp(aux);
    if (!regExp.hasMatch(confirmPassword)) {
      if (password.length < 8)
        return "Insira uma senha com 8 ou mais caracteres!";
      if (!RegExp(r"[A-Z]").hasMatch(confirmPassword))
        return "Precisa ter pelo menos um caracter maiúsculo";
      if (!RegExp(r"[a-z]").hasMatch(confirmPassword))
        return "Precisa ter pelo menos um caracter minúsculo";
      if (!RegExp(r"[0-9]").hasMatch(confirmPassword))
        return "Precisa ter pelo menos um número";
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(confirmPassword))
        return "A senha precisa ter pelo menos 1 caracter especial";
    }
    return null;
  }
}

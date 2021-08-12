import 'package:mobx/mobx.dart';
part 'validators.g.dart';

class Validators = _ValidatorsBase with _$Validators;

abstract class _ValidatorsBase with Store {
  @observable
  String name = "";

  @action
  void setName(String value) => name = value;

  @action
  String? validatorName() {
    if (name.isEmpty) {
      return "Campo vazio, insira um nome válido";
    } else if (!RegExp(r"^[A-Z a-z]{3,16}$").hasMatch(name)) {
      return "Insira um nome válido!";
    }
    return null;
  }

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @action
  String? isEmailValid() {
    if (email.isEmpty) {
      return "Campo vazio, insira um email válido";
    } else if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email)) {
      return "Insira um email válido";
    }
    return null;
  }

  @observable
  String phone = "";

  @action
  String setPhone(String value) => phone = value;

  @action
  String? isPhoneValid() {
    if (phone.isEmpty) {
      return "Campo vazio, insira um telefone válido!";
    } else if (!RegExp(
            r'^(?:(?:\+|00)?(55)\s?)?(?:\(?([1-9][0-9])\)?\s?)?(?:((?:9\d|[2-9])\d{3})\-?(\d{4}))$')
        .hasMatch(phone)) {
      return "Insira um telefone válido!";
    }
    return null;
  }

  @observable
  String cpf = "";

  @action
  String setCpf(String value) => cpf = value;

  @action
  String? isCpfValid() {
    if (cpf.isEmpty) {
      return "Campo vazio, insira um CPF válido!";
    } else if (!RegExp(r'^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$')
        .hasMatch(cpf)) {
      return "CPF válido ou incompleto!";
    }
    return null;
  }

  @observable
  bool terms = false;

  @action
  bool setTerms(bool value) => terms = !value;

  @observable
  String password = "";

  @action
  String setPassword(String value) => password = value;

  @action
    String? isPasswordValid() {
    if (password.length < 8) return "Insira uma senha com 8 ou mais caracteres!";
    if (!password.contains(RegExp(r"[a-z]"))) return "Precisa ter pelo menos um caracter minúsculo";
    if (!password.contains(RegExp(r"[A-Z]"))) return "Precisa ter pelo menos um caracter maiúsculo";
    if (!password.contains(RegExp(r"[0-9]"))) return "Precisa ter pelo menos um número";
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return "A senha precisa ter pelo menos 1 caracter especial";
    return null;
  }

  @observable
  String confirmPassword = "";

   @action
  String setConfirPassword(String value) => confirmPassword = value;


  @action
  String? setConfirmPassword() {
    if (confirmPassword.isEmpty) {
      return "Campo vazio, insira a senha!";
    } else if (confirmPassword != password) {
      return 'A senha não é igual!';
    }
    String pattern = r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(confirmPassword)) {
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

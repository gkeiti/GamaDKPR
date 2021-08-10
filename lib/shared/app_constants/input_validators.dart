class InputValidators {
  String? nameValidator(String? name) {
    if (name != null && name.isEmpty) {
      return "Campo vazio, insira um nome válido!";
    } else if (name!.length < 3) {
      return "Insira um nome válido!";
    }
    return null;
  }

  String? emailValidator(String? email) {
    if (email != null && email.isEmpty) {
      return "Campo vazio, insira um e-mail válido!";
    } else if (!email!.contains("@")) {
      return "Insira um e-mail válido!";
    } else if (!email.contains(".com")) {
      return "Insira um e-mail válido!";
    }
    return null;
  }

  String? phoneValidator(String? phone) {
    if (phone != null && phone.isEmpty) {
      return "Campo vazio, insira um telefone válido!";
    } else if (phone!.length == 11) {
      return "Insira um telefone válido!";
    }
    return null;
  }

  String? cpfValidator(String? cpf) {
    if (cpf != null && cpf.isEmpty) {
      return "Campo vazio, insira um telefone válido!";
    } else if (cpf!.length == 11) {
      return "Insira um telefone válido!";
    }
    return null;
  }

  bool? termsValidator(bool? terms) {
    return terms = true;
  }

  String? passwordValidator(String? password) {
    if (password != null && password.isEmpty) {
      return "Campo vazio, insira uma senha válida!";
    } else if (password!.length < 8) {
      return "Insira uma senha com 8 ou mais caracteres!";
    } else if (!password.contains(".com")) {
      return "Insira uma senha válida!";
    }
    return null;
  }

  String? confirmPasswordValidator(String value, String value1) {
    if (value.isEmpty) {
      return "Campo vazio, insira a senha!";
    } else if (value != value1) {
      return 'A senha não é igual!';
    }

    

    String pattern = r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      if (!RegExp(r'^(?=.?[A-Z])').hasMatch(value))
        return "Precisa ter pelo menos um caracter maiúsculo";
      if (!RegExp(r'^(?=.?[a-z])').hasMatch(value))
        return "Precisa ter pelo menos um caracter minúsculo";
      if (!RegExp(r'^(?=.?[0-9])').hasMatch(value))
        return "Precisa ter pelo menos um número";
      if (!RegExp(r'^(?=.?[!@#$&~]).{8,}').hasMatch(value))
        return "A senha precisa ter 8 caracteres e pelo menos 1 caracter especial";
    }
    return null;
  }
}

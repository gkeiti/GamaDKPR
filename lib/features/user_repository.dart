import 'dart:convert';

class RegisterUser {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  bool checkTerms;
  String? password;
  String? confirmPassword;
  RegisterUser({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.checkTerms = false,
    this.password,
    this.confirmPassword,
  });

  RegisterUser copyWith({
    String? name,
    String? email,
    String? phone,
    String? cpf,
    bool? checkTerms,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterUser(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      checkTerms: checkTerms ?? this.checkTerms,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'checkTerms': checkTerms,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      checkTerms: map['checkTerms'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) =>
      RegisterUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterUser(name: $name, email: $email, phone: $phone, cpf: $cpf, checkTerms: $checkTerms, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterUser &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.cpf == cpf &&
      other.checkTerms == checkTerms &&
      other.password == password &&
      other.confirmPassword == confirmPassword;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      cpf.hashCode ^
      checkTerms.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode;
  }
}

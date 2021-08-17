import 'dart:convert';

class RegisterUser {
String? uid;
String? name;
String? email;
String? password;
String? confirmPassword;
String? phone;
String? cpf;
bool checkTerms;
  RegisterUser({
    this.uid,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.cpf,
    this.checkTerms = false,
  });

  RegisterUser copyWith({
    String? uid,
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? phone,
    String? cpf,
    bool? checkTerms,
  }) {
    return RegisterUser(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      checkTerms: checkTerms ?? this.checkTerms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'cpf': cpf,
      'checkTerms': checkTerms,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
      phone: map['phone'],
      cpf: map['cpf'],
      checkTerms: map['checkTerms'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) => RegisterUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(uid: $uid, name: $name, email: $email, password: $password, confirmPassword: $confirmPassword, phone: $phone, cpf: $cpf, checkTerms: $checkTerms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is RegisterUser &&
      other.uid == uid &&
      other.name == name &&
      other.email == email &&
      other.password == password &&
      other.confirmPassword == confirmPassword &&
      other.phone == phone &&
      other.cpf == cpf &&
      other.checkTerms == checkTerms;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      password.hashCode ^
      confirmPassword.hashCode ^
      phone.hashCode ^
      cpf.hashCode ^
      checkTerms.hashCode;
  }
}

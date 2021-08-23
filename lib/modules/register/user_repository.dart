import 'dart:convert';

class RegisterUser {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  bool checkTerms;
  String? uid;
  RegisterUser({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.checkTerms = false,
    this.uid,
  });

  RegisterUser copyWith({
    String? name,
    String? email,
    String? phone,
    String? cpf,
    bool? checkTerms,
    String? uid,
  }) {
    return RegisterUser(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      cpf: cpf ?? this.cpf,
      checkTerms: checkTerms ?? this.checkTerms,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'cpf': cpf,
      'checkTerms': checkTerms,
      'uid': uid,
    };
  }

  factory RegisterUser.fromMap(Map<String, dynamic> map) {
    return RegisterUser(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      cpf: map['cpf'],
      checkTerms: map['checkTerms'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUser.fromJson(String source) =>
      RegisterUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterUser(name: $name, email: $email, phone: $phone, cpf: $cpf, checkTerms: $checkTerms, uid: $uid)';
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
      other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      cpf.hashCode ^
      checkTerms.hashCode ^
      uid.hashCode;
  }
}

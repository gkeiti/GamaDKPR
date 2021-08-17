import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String email;
  final String cpf;
  final String uid;
  final String phone;
  final String name;

  UserData({
    required this.email,
    required this.cpf,
    required this.uid,
    required this.phone,
    required this.name,
  });

  UserData copyWith({
    String? email,
    String? cpf,
    String? uid,
    String? phone,
    String? name,
  }) {
    return UserData(
      email: email ?? this.email,
      cpf: cpf ?? this.cpf,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'cpf': cpf,
      'uid': uid,
      'phone': phone,
      'name': name,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      email: map['email'],
      cpf: map['cpf'],
      uid: map['uid'],
      phone: map['phone'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserData(email: $email, cpf: $cpf, uid: $uid, phone: $phone, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserData &&
        other.email == email &&
        other.cpf == cpf &&
        other.uid == uid &&
        other.phone == phone &&
        other.name == name;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        cpf.hashCode ^
        uid.hashCode ^
        phone.hashCode ^
        name.hashCode;
  }
}
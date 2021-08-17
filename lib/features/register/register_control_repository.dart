import 'package:cloud_firestore/cloud_firestore.dart';

import '../user_repository.dart';

abstract class RegisterControlRepository {
  Future<void> createAccount(RegisterUser user);
}

class RegisterControlRepositoryImpl extends RegisterControlRepository {
  @override
  Future<void> createAccount(RegisterUser user) async {
    try {
      await FirebaseFirestore.instance.collection('/user').add({
        'uid': user.uid,
        'name': user.name,
        'email': user.email,
        'phone': user.phone,
        'cpf': user.cpf,
        'terms': user.checkTerms,
        'password': user.password,
        'confirmPassword': user.confirmPassword,
      });
    } catch (e) {
      print(e);
    }
  }
}

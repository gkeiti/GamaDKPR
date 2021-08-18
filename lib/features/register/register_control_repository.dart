import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';

abstract class RegisterControlRepository {
  Future<void> createAccount(RegisterUser user);
}

class RegisterControlRepositoryImpl extends RegisterControlRepository {

  @override
  Future<void> createAccount(RegisterUser user) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      final _user = response.user;
      Map<String, dynamic> _userMap = user.toMap();

      await FirebaseFirestore.instance
          .collection("/user")
          .doc(_user!.uid)
          .set(_userMap);
    } catch (e) {
      print(e);
    }
  }
}

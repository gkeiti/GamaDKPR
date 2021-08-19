import 'package:cloud_firestore/cloud_firestore.dart';

abstract class LoginRepository {
  Future<bool> getEmail(String email);
}

class LoginRepositoryImpl extends LoginRepository {
  @override
  Future<bool> getEmail(String email) async {
    final response = await FirebaseFirestore.instance
        .collection('/users')
        .where('email', isEqualTo: email)
        .get();
    if (response.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trabalho_final_dgpr/modules/login/models/login_model.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';

abstract class LoginRepository {
  Future<UserData?> login(LoginModel loginModel);
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

  @override
  Future<UserData?> login(LoginModel loginModel) async {
    try {
      final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginModel.email!,
        password: loginModel.password!,
      );
      final user = await FirebaseFirestore.instance
          .collection('/users')
          .doc(response.user!.uid)
          .get();
      if (user.data() != null) {
        return UserData.fromMap(user.data()!);
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('Campos errados');
      }
      return null;
    }
  }
}
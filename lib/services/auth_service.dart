import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalho_final_dgpr/login/login_controller.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      if (response.user != null) {
        return 'Positivo';
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// logica do gringo
  Future<String?> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Deslogado';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Future<String?> signUp(UserModel user, String password) async {
  //   try {
  //     final response = await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: user.email, password: password);
  //     saveUser(user);
  //     final newUser = response.user;
  //     await FirebaseFirestore.instance
  //         .collection("/users")
  //         .doc(user.uid)
  //         .set({"email": user.email, "created": FieldValue.serverTimestamp()});
  //     print(user);
  //     return 'Deslogado';
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }

  // saveUser(UserModel user) {}

}

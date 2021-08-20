import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:trabalho_final_dgpr/shared/model/user_model.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserData?> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

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
        return null;
      }
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

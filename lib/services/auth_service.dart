import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

// class AuthException implements Exception {
//   String message;
//   AuthException(this.message);
// }

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Logado";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

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
}



//mudar pra auth repository e tirar da pasta services
// class AuthService extends ChangeNotifier {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   User? usuario;
//   bool isLoading = true;

//   AuthService() {
//     _authCheck();
//   }
//   _authCheck() {
//     _auth.authStateChanges().listen(
//       (User? user) {
//         usuario = (user == null) ? null : user;
//         isLoading = false;
//         notifyListeners();
//       },
//     );
//   }

//   _getUser() {
//     usuario = _auth.currentUser;
//     notifyListeners();
//   }

//   registrar(String email, String senha) async {
//     try {
//       final response = await _auth.createUserWithEmailAndPassword(
//           email: email, password: senha);
//           print('email ${email}');
//           print('senha ${senha}');
//       _getUser();
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         throw AuthException('A senha é muito fraca');
//       } else if (e.code == 'email-already-in-use') {
//         throw AuthException('Este email já está cadastrado');
//       }
//     } catch (e) {
//       throw e;
//     }
//   }

//   // Future<String?> login({required String email, required String senha}) async {
//   //   try {
//   //     await _auth.signInWithEmailAndPassword(email: email, password: senha);
//   //     return 'Logado';
//   //   } on FirebaseAuthException catch (e) {
//   //     return e.message;
//   //   }
//   // }

//   //logica do Renan

//   // User? user;
//   // Future<void> login(String email, String senha) async {
//   //   try {
//   //     final response = await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //       email: email,
//   //       password: senha,
//   //     );
//   //     user = response.user;
//   //     print(user!.uid);
//   //   } on FirebaseAuthException catch (e) {
//   //     if (e.code == 'user-not-found' || e.code == 'wrong-password') {
//   //       print('Campos errados');
//   //     }
//   //   }
//   // }

// // -------------------------------------------------------------------//

//   login(String email, String senha) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: senha);
//       _getUser();
//       print(email);
//       print(senha);
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//       } else if (e.code == 'email-already-in-use') {
//         throw AuthException('Este email já está cadastrado');
//       }
//     }
//   }

//   logout() async {
//     await _auth.signOut();
//     _getUser();
//   }
// }

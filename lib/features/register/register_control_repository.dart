// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:trabalho_final_dgpr/shared/app_constants/validator.dart';

// import '../user_repository.dart';
// import 'register_password/register_password.dart';

// abstract class RegisterControlRepository {
//   RegisterPasswordPage? register = RegisterPasswordPage(passwordKey: passwordKey, user: user);
//   Future<void> createAccount(RegisterUser user);
// }

// class RegisterControlRepositoryImpl extends RegisterControlRepository {


//   @override
//   Future<void> createAccount(RegisterUser user) async {
//     try {
//       final response = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: user.email!, password: );
//       final _user = response.user;
//       Map<String, dynamic> _userMap = user.toMap();

//       await FirebaseFirestore.instance
//           .collection("/user")
//           .doc(_user!.uid)
//           .set(_userMap);
//     } catch (e) {
//       print(e);
//     }
//   }
// }
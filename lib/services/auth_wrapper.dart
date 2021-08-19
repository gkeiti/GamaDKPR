// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:trabalho_final_dgpr/login/login_password.dart';
// import 'package:trabalho_final_dgpr/login/login_screen.dart';
// import 'package:trabalho_final_dgpr/modules/home/pages/home_page.dart';
// import 'package:provider/provider.dart';

// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   _AuthWrapperState createState() => _AuthWrapperState();
// }

// class _AuthWrapperState extends State<AuthWrapper> {
//   User? firebaseUser;



//   @override
//   initState() {
//     WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
//       firebaseUser = context.watch<User?>();
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (firebaseUser == null) {
//       return LoginPassword();
//     } else {
//       return HomePage();
//     }
//   }
// }

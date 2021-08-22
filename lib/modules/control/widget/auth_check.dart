
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:trabalho_final_dgpr/login/login_screen.dart';
// import 'package:trabalho_final_dgpr/modules/home/pages/home_page.dart';
// import 'package:trabalho_final_dgpr/services/auth_service.dart';

// class AuthCheck extends StatefulWidget {
//   const AuthCheck({Key? key}) : super(key: key);

//   @override
//   _AuthCheckState createState() => _AuthCheckState();
// }

// class _AuthCheckState extends State<AuthCheck> {
//   @override
//   Widget build(BuildContext context) {
//     AuthService auth = Provider.of<AuthService>(context);
//     if (auth.isLoading)
//       return loading();
//     else if (auth.usuario == null)
//       return LoginScreen();
//     else
//       return HomePage();
//   }

//   loading() {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }

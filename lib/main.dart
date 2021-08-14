import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_dgpr/login/login_screen.dart';
import 'package:trabalho_final_dgpr/modules/home/pages/home_page.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
import 'app_widget.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: AppWidget(),
    ),
  );
}

// class AuthWrapper extends StatelessWidget {
//   const AuthWrapper({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();
//     if (firebaseUser != null) {
//       return HomePage();
//     }
//     return LoginScreen();
//   }
// }



// BOTAR BOTAO DE LOGOUT NO DRAWER
// TESTAR LOGICA DE LOGIN E REGISTER
// TESTAR CIRCULAR INDICATOR DO BOTAO NA LOGIN E REPLICAR NAS OUTRAS TELAS!

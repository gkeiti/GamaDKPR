import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_dgpr/features/login_screen.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
        ),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    ),
  );
}

// BOTAR BOTAO DE LOGOUT NO DRAWER
// TESTAR LOGICA DE LOGIN E REGISTER
// TESTAR CIRCULAR INDICATOR DO BOTAO NA LOGIN E REPLICAR NAS OUTRAS TELAS!

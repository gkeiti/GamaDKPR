import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/modules/home/pages/error_home_page.dart';
import 'app_widget.dart';

class FirebaseWidget extends StatefulWidget {
  const FirebaseWidget({Key? key}) : super(key: key);

  @override
  _FirebaseWidgetState createState() => _FirebaseWidgetState();
}

class _FirebaseWidgetState extends State<FirebaseWidget> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorHomePage();
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return AppWidget();
          }
          return CircularProgressIndicator();
        });
  }
}

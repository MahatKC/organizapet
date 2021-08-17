import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:organizapet/modules/erro_firebase/erro_firebase.dart';
import 'package:organizapet/modules/splash/splash_page_widget.dart';
import 'package:organizapet/screen_manager.dart';

String perfil_user() {
  return "clear";
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return DeuRuim();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ScreenManager();
        }
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'OrganizaPET',
            home: SplashPageWidget());
      },
    );
  }
}

class DeuRuim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ErroFirebase();
  }
}

import 'package:flutter/material.dart';
import 'package:organizapet/modules/authentication/user_data.dart';
import 'package:organizapet/modules/splash/splash_page_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Future<void> start;

  @override
  void initState() {
    super.initState();
    start = getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: start,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return SplashPageWidget();
          } else {
            final UserData user = snapshot.data as UserData;
            if (user.name.isEmpty) {
              go_to_login_page(context, user);
            } else {
              change_screen(context, user);
            }

            return SplashPageWidget();
          }
        });
  }

  Future<void> change_screen(BuildContext context, UserData user) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/lista_petianos", arguments: user);
  }

  Future<void> go_to_login_page(BuildContext context, UserData user) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/login_page", arguments: user);
  }

  Future<UserData> getSharedPreferences() async {
    UserData user = UserData();
    await user.set_prefs();
    //await user.set_perfil(perfil_user());
    user.print_shared_prefs();
    return user;
  }
}

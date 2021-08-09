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
      future:  start,
      builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return SplashPageWidget();
      } else {
        final UserData user = snapshot.data as UserData;
        change_screen(context, user);
        return SplashPageWidget();
      }
    });
  }

  Future<void> change_screen(BuildContext context, UserData user) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/lista_petianos",
        arguments: user);
  }

  Future<UserData> getSharedPreferences() async {
    UserData user = await UserData();
    user.set_perfil("gerente");
    print(user.name);
    return user;
  }
}

import 'package:flutter/material.dart';
import 'package:organizapet/modules/current_user_data/current_user_data.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_arguments.dart';
import 'package:organizapet/modules/splash/splash_page_widget.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/modules/visualizar_projeto/visualizar_projeto_arguments.dart';

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
            final CurrentUserData user = snapshot.data as CurrentUserData;
            if (user.name.isEmpty) {
              go_to_login_page(context, user);
            } else {
              change_screen(context, user);
            }

            return SplashPageWidget();
          }
        });
  }

  Future<void> change_screen(BuildContext context, CurrentUserData user) async {
    await Future.delayed(Duration(seconds: 3));
    //Navigator.pushReplacementNamed(context, "/editar_tarefa", arguments: EditarProjetoArguments(nome: "A&B Game Jam", user: user));
    Navigator.pushReplacementNamed(context, "/visualizar_tarefa", arguments: VisualizarProjetosArguments("A&B Game Jam", true, user));
   //Navigator.pushReplacementNamed(context, "/lista_projetos", arguments: user);
    //Navigator.pushReplacementNamed(context, "/visualizar_projeto", arguments: VisualizarProjetosArguments("A&B Game Jam", true, user));
    //Navigator.pushReplacementNamed(context, "/editar_projeto", arguments: EditarProjetoArguments(nome: "A&B Game Jam", user: user));
  }

  Future<void> go_to_login_page(
      BuildContext context, CurrentUserData user) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, "/login_page", arguments: user);
  }

  Future<CurrentUserData> getSharedPreferences() async {
    CurrentUserData user = CurrentUserData();
    await user.set_prefs();
    //await user.set_perfil(perfil_user());
    user.print_shared_prefs();
    return user;
  }
}

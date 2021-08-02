import 'package:flutter/material.dart';
import 'package:organizapet/modules/login/login_page.dart';
import 'package:organizapet/modules/lista_petianos/lista_petianos.dart';
import 'package:organizapet/modules/dados_petiano/petiano.dart';
import 'package:organizapet/modules/splash/splash_page.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_petiano.dart';

class ScreenManager extends StatelessWidget {
  const ScreenManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrganizaPET',
      initialRoute: '/lista_petianos',
      routes: {
        '/splash': (context) => SplashPage(),
        '/lista_petianos': (context) => ListaPetianos(),
        '/visualizar_dados_petiano': (context) => VisualizarDadosPetiano(),
        //'/visualizar_petiano': (context) =>
        '/dados_petiano': (context) => PerfilUsuario(
            nome: ModalRoute.of(context)!.settings.arguments as String)
      },
    );
  }
}

/*
//return PerfilUsuario(nome: "");
          return PerfilUsuario(nome: "Mateus Karvat Camara");
          //return SplashPage();
          //return LoginPage();
          //return ListaPetianos();
*/
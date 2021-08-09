import 'package:flutter/material.dart';
import 'package:organizapet/modules/login/login_page.dart';
import 'package:organizapet/modules/lista_petianos/lista_petianos.dart';
import 'package:organizapet/modules/dados_petiano/petiano.dart';
import 'package:organizapet/modules/splash/splash_page.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_petiano.dart';



class ScreenManager extends StatelessWidget {
  const ScreenManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OrganizaPET',
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/lista_petianos': (context) => ListaPetianos(
            isTutor: ModalRoute.of(context)!.settings.arguments as bool),
        '/visualizar_dados_petiano': (context) => VisualizarDadosPetiano(
            dados: ModalRoute.of(context)!.settings.arguments as VisualizarDadosArguments),
        //'/visualizar_petiano': (context) =>
        '/dados_petiano': (context) => PerfilUsuario(
            nome: ModalRoute.of(context)!.settings.arguments as String),
        //'/visualizar_dados_petianos_editavel': (context) => VisualizarDadosPetianoEditavel(
        //    enable_edit: ModalRoute.of(context)!.settings.arguments as bool),
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
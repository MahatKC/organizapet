import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano_arguments.dart';
import 'package:organizapet/modules/editar_tarefa/editar_tarefa.dart';
import 'package:organizapet/modules/login/login_page.dart';
import 'package:organizapet/modules/lista_petianos/lista_petianos.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano.dart';
import 'package:organizapet/modules/splash/splash_page.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_petiano.dart';

import 'modules/current_user_data/current_user_data.dart';
import 'modules/editar_projeto/editar_projeto.dart';
import 'modules/editar_projeto/editar_projeto_arguments.dart';
import 'modules/lista_projetos/lista_projetos.dart';
import 'modules/visualizar_projetos/visualizar_projetos.dart';
import 'modules/visualizar_projetos/visualizar_projetos_arguments.dart';

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
            user:
                ModalRoute.of(context)!.settings.arguments as CurrentUserData),
        '/visualizar_dados_petiano': (context) => VisualizarDadosPetiano(
            dados: ModalRoute.of(context)!.settings.arguments
                as VisualizarDadosArguments),
        '/editar_petiano': (context) => EditarPetiano(
            dados: ModalRoute.of(context)!.settings.arguments
                as EditarPetianoArguments),
        '/login_page': (context) => LoginPage(),
        '/lista_projetos': (context) => ListaProjetos(
            user:
                ModalRoute.of(context)!.settings.arguments as CurrentUserData),
        '/visualizar_projeto': (context) => VisualizarProjetos(
            dados: ModalRoute.of(context)!.settings.arguments
                as VisualizarProjetosArguments),
        '/editar_projeto': (context) => EditarProjeto(
            dados: ModalRoute.of(context)!.settings.arguments
                as EditarProjetoArguments),
        '/editar_tarefa': (context) => EditarTarefa(
            dados: ModalRoute.of(context)!.settings.arguments
                as EditarProjetoArguments),
      },
    );
  }
}

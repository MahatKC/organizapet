import 'package:flutter/material.dart';
import 'package:organizapet/modules/useful_functions/document_title.dart';
import 'package:organizapet/modules/dados_petiano/petianos_controller.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/modules/useful_functions/print_current_time.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/menu/menuSanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/single_page_button/single_page_button.dart';

class PerfilUsuario extends StatefulWidget {
  final String nome;
  PerfilUsuario({required this.nome, Key? key}) : super(key: key);

  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  final controller = petianosController();
  bool in_database = false;
  bool access_db = true;
  var dbController = dadosPetiano(nome: "");

  @override
  Widget build(BuildContext context) {
    if (access_db == true && widget.nome.isNotEmpty && in_database == false) {
      readDB();
    }
    print_time_now("before if");
    if (in_database == true) {
      /*if (dbController.rg == null) {
        setState(() {});
        print("rg null");
      } else {*/
      controller.instantiateAll(dbController);
      print_time_now("in if");
      //}
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.background,
          drawer: MenuSanduiche(),
          appBar: AppBar(
            title: BarraApp(),
          ),
          body: ListView(
            children: [
              PageTitle(title: "Dados do Petiano"),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(children: [
                  TextField(
                    controller: controller.nomeController,
                    decoration: InputDecoration(hintText: " Nome"),
                    enabled: !in_database,
                  ),
                  TextField(
                    controller: controller.rgController,
                    decoration: InputDecoration(hintText: " RG"),
                  ),
                  TextField(
                    controller: controller.cpfController,
                    decoration: InputDecoration(hintText: " CPF"),
                  ),
                  TextField(
                    controller: controller.raController,
                    decoration: InputDecoration(hintText: " RA"),
                  ),
                  TextField(
                    controller: controller.telefoneController,
                    decoration: InputDecoration(hintText: " Telefone"),
                  ),
                  TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(hintText: " E-mail"),
                  ),
                  TextField(
                    controller: controller.dataNascimentoController,
                    decoration:
                        InputDecoration(hintText: " Data de nascimento"),
                  ),
                  TextField(
                    controller: controller.anoController,
                    decoration: InputDecoration(hintText: " Ano"),
                  ),
                  TextField(
                    controller: controller.temaICVController,
                    decoration: InputDecoration(hintText: " Tema ICV"),
                  ),
                  TextField(
                    controller: controller.orientadorController,
                    decoration: InputDecoration(hintText: " Orientador"),
                  ),
                  TextField(
                    controller: controller.camisetaController,
                    decoration: InputDecoration(hintText: " Camiseta"),
                  ),
                  TextField(
                    controller: controller.githubController,
                    decoration: InputDecoration(hintText: " Github"),
                  ),
                  TextField(
                    controller: controller.instagramController,
                    decoration: InputDecoration(hintText: " Instagram"),
                  ),
                ]),
              ),
              SinglePageButton(buttonLabel: "Salvar", callback: save_button_function)
              /*Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.button),
                        elevation: MaterialStateProperty.all(5),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 40, vertical: 9.5))),
                    onPressed: () {
                      if (access_db == true) {
                        eliminado(controller.nomeController.text);
                      }
                    },
                    child: (Text(
                      "Deletar",
                      style: TextStyles.button,
                    )),
                  ),
                )*/
            ],
          )),
    );
  }

  void readDB() async {
    dbController = dadosPetiano(nome: widget.nome);
    await dbController.read();
    in_database = true;
    print_time_now("readdb func");
  }

  void createDB(List all_texts) {
    if (all_texts.first.isNotEmpty) {
      dbController = dadosPetiano(nome: all_texts.first);
      dbController.dadosPetianoFromLista(all_texts);
      dbController.write();
    } else {
      print("Caro tutor, faltou o nome!");
      //exibir mensagem de que faltou inserir o nome
    }
  }

  void eliminado(String nome) {
    if (nome.isNotEmpty) {
      final dbController = dadosPetiano(nome: nome);
      dbController.delete();
      //mensagem de que a remoção deu certo
    }
  }

  void save_button_function() {
    if (access_db == true) {
      createDB(controller.get_all_texts());
    }
  }
}

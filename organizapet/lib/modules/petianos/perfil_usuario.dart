import 'package:flutter/material.dart';
import 'package:organizapet/modules/petianos/document_title.dart';
import 'package:organizapet/modules/petianos/petianos_controller.dart';
import 'package:organizapet/modules/petianos/petianos_db_controller.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_text_styles.dart';
import 'package:organizapet/shared/widgets/appBar.dart';
import 'package:organizapet/shared/widgets/menuSanduiche.dart';

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
    if (access_db == true) {
      readDB();
    }

    print("pikachu $in_database");
    if (in_database == true) {
      controller.instantiateAll(dbController);
      setState(() {});
    }

    return MaterialApp(
      home: Scaffold(
          backgroundColor: AppColors.background,
          drawer: MenuSanduiche(),
          appBar: AppBar(
            title: BarraApp(),
          ),
          body: ListView(children: [
            Center(
                heightFactor: 3,
                child: Text("Dados do Petiano",
                    style: TextStyle(fontSize: 27, shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                      )
                    ]))),
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
              decoration: InputDecoration(hintText: " Data de nascimento"),
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
            Row(
              children: [
                Padding(
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
                        createDB(controller.get_all_texts());
                      }
                    },
                    child: (Text(
                      "Salvar",
                      style: TextStyles.button,
                    )),
                  ),
                ),
                Padding(
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
                )
              ],
            )
          ])),
    );
  }

  void readDB() async {
    if (widget.nome.isNotEmpty && in_database == false) {
      dbController = dadosPetiano(nome: widget.nome);
      await dbController.read();
      in_database = true;
    }
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
}

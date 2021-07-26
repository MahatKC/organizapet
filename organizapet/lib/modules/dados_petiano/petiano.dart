import 'package:flutter/material.dart';
import 'package:organizapet/modules/dados_petiano/petianos_controller.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/modules/useful_functions/print_current_time.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
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
  late Future<void> start;

  @override
  void initState() {
    super.initState();
    start = read_db();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: AppColors.background,
          drawer: MenuSanduiche(),
          appBar: AppBar(title: BarraApp()),
          body: FutureBuilder(
            future: start,
            builder: (context, snapshot){
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                final dbController = snapshot.data as dadosPetiano;
                if (in_database == true && widget.nome.isNotEmpty) {
                  controller.instantiateAll(dbController);
                }
                return ListView(
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
                            decoration: InputDecoration(
                                hintText: " Data de nascimento"),
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
                            decoration:
                                InputDecoration(hintText: " Orientador"),
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
                      SinglePageButton(
                          buttonLabel: "Salvar", callback: save_button_function)
                    ],
                  );
              }
            },
          )
        )
      );
  }

  Future<dadosPetiano> read_db() async {
    var dbController = dadosPetiano(nome: widget.nome);
    if (access_db == true && widget.nome.isNotEmpty && in_database == false) {
      await dbController.read();
      in_database = true;
    }
    return dbController;
  }

  void createDB(List all_texts) {
    if (all_texts.first.isNotEmpty) {
      var dbController = dadosPetiano(nome: all_texts.first);
      dbController.dadosPetianoFromLista(all_texts);
      dbController.write();
    } else {
      print("Caro tutor, faltou o nome!");
      //TO-DO: exibir mensagem de que faltou inserir o nome
    }
  }

  void eliminado(String nome) {
    if (nome.isNotEmpty) {
      final dbController = dadosPetiano(nome: nome);
      dbController.delete();
      //TO-DO: mensagem de que a remoção deu certo
    }
  }

  void save_button_function() {
    if (access_db == true) {
      createDB(controller.get_all_texts());
    }
  }

  void delete_button_function() {
    if (access_db == true) {
      eliminado(controller.nomeController.text);
    }
  }
}

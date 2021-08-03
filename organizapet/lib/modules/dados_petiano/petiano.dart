import 'package:flutter/material.dart';
import 'package:organizapet/modules/dados_petiano/petianos_controller.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/modules/useful_functions/print_current_time.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/menu/menuSanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/petiano_input_field/petiano_input_field.dart';
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
    return Scaffold(
            backgroundColor: AppColors.background,
            drawer: MenuSanduiche(),
            appBar: AppBar(title: BarraApp()),
            body: FutureBuilder(
              future: start,
              builder: (context, snapshot) {
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
                          PetianoInputField(
                              ctrl: controller.nomeController,
                              hint: "Nome",
                              not_in_database: !in_database),
                          PetianoInputField(
                            ctrl: controller.nomeCurtoController,
                            hint: "Nome Curto"),
                          PetianoInputField(
                              ctrl: controller.rgController, hint: "RG"),
                          PetianoInputField(
                              ctrl: controller.cpfController, hint: "CPF"),
                          PetianoInputField(
                              ctrl: controller.raController, hint: "RA"),
                          PetianoInputField(
                              ctrl: controller.telefoneController,
                              hint: "Telefone"),
                          PetianoInputField(
                              ctrl: controller.emailController, hint: "E-mail"),
                          PetianoInputField(
                              ctrl: controller.dataNascimentoController,
                              hint: "Data de nascimento"),
                          PetianoInputField(
                              ctrl: controller.anoController, hint: "Ano"),
                          PetianoInputField(
                              ctrl: controller.temaICVController,
                              hint: "Tema ICV"),
                          PetianoInputField(
                              ctrl: controller.orientadorController,
                              hint: "Orientador"),
                          PetianoInputField(
                              ctrl: controller.camisetaController,
                              hint: "Camiseta"),
                          PetianoInputField(
                              ctrl: controller.githubController,
                              hint: "Github"),
                          PetianoInputField(
                              ctrl: controller.instagramController,
                              hint: "Instagram"),
                        ]),
                      ),
                      SinglePageButton(
                          buttonLabel: "Salvar", callback: save_button_function)
                    ],
                  );
                }
              },
            ));
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

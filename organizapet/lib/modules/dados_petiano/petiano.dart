import 'package:flutter/material.dart';
import 'package:organizapet/modules/dados_petiano/petiano_arguments.dart';
import 'package:organizapet/modules/dados_petiano/petianos_controller.dart';
import 'package:organizapet/modules/dados_petiano/petianos_db_controller.dart';
import 'package:organizapet/modules/useful_functions/print_current_time.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/menu/menu_sanduiche.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/petiano_input_field/petiano_input_field.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';
import 'package:organizapet/shared/widgets/single_page_button/single_page_button.dart';

class PerfilUsuario extends StatefulWidget {
  final PetianoArguments dados;

  PerfilUsuario({required this.dados, Key? key}) : super(key: key);

  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  final controller = petianosController();
  bool in_database = false;
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
        drawer: MenuSanduiche(user: widget.dados.user),
        appBar: AppBar(title: BarraApp()),
        body: FutureBuilder(
          future: start,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else {
              final dbController = snapshot.data as dadosPetiano;
              if (in_database == true && widget.dados.nome.isNotEmpty) {
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
                          ctrl: controller.rgController, 
                          mascara: controller.maskRg,
                          isNumeric: true,
                          hint: "RG"),
                      PetianoInputField(
                          ctrl: controller.cpfController,
                          mascara: controller.maskCpf,
                          isNumeric: true,
                          hint: "CPF"),
                      PetianoInputField(
                          ctrl: controller.raController, 
                          isNumeric: true,
                          hint: "RA"),
                      PetianoInputField(
                          ctrl: controller.telefoneController,
                          mascara: controller.maskTelefone,
                          isNumeric: true,
                          hint: "Telefone"),
                      PetianoInputField(
                          ctrl: controller.emailController, hint: "E-mail"),
                      PetianoInputField(
                          ctrl: controller.dataNascimentoController,
                          mascara: controller.maskDtNascimento,
                          isNumeric: true,
                          hint: "Data de nascimento"),
                      PetianoInputField(
                          ctrl: controller.anoController, 
                          mascara: controller.maskAno,
                          isNumeric: true,
                          hint: "Ano"),
                      PetianoInputField(
                          ctrl: controller.temaICVController, hint: "Tema ICV"),
                      PetianoInputField(
                          ctrl: controller.orientadorController,
                          hint: "Orientador"),
                      PetianoInputField(
                          ctrl: controller.camisetaController,
                          hint: "Camiseta"),
                      PetianoInputField(
                          ctrl: controller.githubController, hint: "Github"),
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
    var dbController = dadosPetiano(nome: widget.dados.nome);
    if (widget.dados.nome.isNotEmpty && in_database == false) {
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
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
              PopupUmaOpcao(title: "Erro", message: "Impossível adicionar membro sem informar seu nome!"),
      );
    }
  }

  void save_button_function() {
    createDB(controller.get_all_texts());
  }
}

import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano_arguments.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petianos_controller.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petianos_db_controller.dart';
import 'package:organizapet/modules/menu/menu_sanduiche.dart';
import 'package:organizapet/modules/popup_adicionar_projeto/popup_adicionar_projeto.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/petiano_input_field/petiano_input_field.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes_duas_funcoes.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';
import 'package:organizapet/shared/widgets/center_text_button/center_text_button.dart';
import 'package:organizapet/shared/widgets/responsive_list/responsive_list.dart';

class EditarPetiano extends StatefulWidget {
  final EditarPetianoArguments dados;

  EditarPetiano({required this.dados, Key? key}) : super(key: key);

  @override
  _EditarPetianoState createState() => _EditarPetianoState();
}

class _EditarPetianoState extends State<EditarPetiano> {
  final controller = petianosController();
  bool in_database = false;
  late String new_name;
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
              return ResponsiveList(
                  list: ListView(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: CenterTextButton(
                        buttonLabel: "Salvar", callback: save_button_function),
                  )
                ],
              ));
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
      new_name = all_texts.first;
      bool is_new_petiano = widget.dados.nome.isEmpty;
      if (is_new_petiano) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => PopupDuasOpcoes(
              title: "Atenção",
              message: "Tem certeza que inseriu o nome de " +
                  new_name +
                  " corretamente?",
              yes_callback: continua_write),
        );
      } else {
        var dbController = dadosPetiano(nome: new_name);
        dbController.dadosPetianoFromLista(all_texts);
        dbController.write();

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => PopupUmaOpcao(
              title: "Sucesso",
              message: "Dados de " + new_name + " atualizados!",
              after_func: update_concluded),
        );
      }
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => PopupUmaOpcao(
            title: "Erro",
            message: "Impossível adicionar membro sem informar seu nome!"),
      );
    }
  }

  void continua_write() {
    List all_texts = controller.get_all_texts();
    var dbController = dadosPetiano(nome: all_texts.first);
    dbController.dadosPetianoFromLista(all_texts);
    dbController.write();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopupUmaOpcao(
          title: "Sucesso",
          message: all_texts.first + " adicionado(a) ao OrganizaPET!",
          after_func: register_concluded),
    );
  }

  void save_button_function() {
    createDB(controller.get_all_texts());
  }

  void register_concluded() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopupDuasOpcoesDuasFuncoes(
          title: "Atenção",
          message: "Deseja adicionar " + new_name + " aos projetos do grupo?",
          yes_callback: adiciona_projeto,
          no_callback: close_screen),
    );
  }

  void adiciona_projeto() {
    create_popup_widget(context);
  }

  Widget create_popup_widget(BuildContext context) {
    return PopupAdicionarProjeto(dados: widget.dados, nome_membro: new_name);
  }

  void close_screen() {
    Navigator.popUntil(context, ModalRoute.withName('/lista_petianos'));
  }

  void update_concluded() {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, "/visualizar_dados_petiano",
        arguments: VisualizarDadosArguments(widget.dados.nome,
            widget.dados.nome == widget.dados.user.name, widget.dados.user));
  }
}

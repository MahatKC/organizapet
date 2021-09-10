import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_arguments.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_controller.dart';
import 'package:organizapet/modules/editar_projeto/editar_projeto_db_controller.dart';
import 'package:organizapet/modules/menu/menu_sanduiche.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/modules/visualizar_projetos/visualizar_projetos_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/icon_title_subtitle_box_editavel/icon_title_subtible_box_editavel.dart';
import 'package:organizapet/shared/widgets/long_text_input/long_text_input.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/petiano_input_field/petiano_input_field.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';
import 'package:organizapet/shared/widgets/center_text_button/center_text_button.dart';
import 'package:organizapet/shared/widgets/responsive_list/responsive_list.dart';

class EditarProjeto extends StatefulWidget {
  //mudar essa variável depois
  final EditarProjetoArguments dados;

  EditarProjeto({required this.dados, Key? key}) : super(key: key);

  @override
  _EditarProjetoState createState() => _EditarProjetoState();
}

class _EditarProjetoState extends State<EditarProjeto> {
  final controller = projetosController();
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
              final dbController = snapshot.data as dadosProjeto;
              if (in_database == true && widget.dados.nome.isNotEmpty) {
                controller.instantiateAll(dbController);
              }
              return ResponsiveList(
                  list: ListView(
                children: [
                  PageTitle(title: "Dados do Projeto"),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Column(children: [
                      PetianoInputField(
                          ctrl: controller.nomeController,
                          hint: "Título",
                          not_in_database: !in_database),
                      IconTitleSubtitleBoxEditavel(
                          titulo: "Gerentes",
                          subtitulo: controller.membrosController.text),
                      LongTextInput(
                        textoLabel: "Descrição",
                        ctrl: controller.descricaoController,
                      ),
                      IconTitleSubtitleBoxEditavel(
                          subtitulo: controller.membrosController.text,
                          titulo: "Membros"),
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

  Future<dadosProjeto> read_db() async {
    var dbController = dadosProjeto(nome: widget.dados.nome);
    if (widget.dados.nome.isNotEmpty && in_database == false) {
      await dbController.read();
      in_database = true;
    }
    return dbController;
  }

  void createDB(List all_texts) {
    print(all_texts);
    if (all_texts.first.isNotEmpty) {
      String nome = all_texts.first.first;
      bool is_new_projeto = widget.dados.nome.isEmpty;
      if (is_new_projeto) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => PopupDuasOpcoes(
              title: "Atenção",
              message: "Tem certeza que inseriu o nome do projeto " +
                  nome +
                  " corretamente?",
              yes_callback: continua_write),
        );
      } else {
        var dbController = dadosProjeto(nome: nome);
        print(all_texts);
        print("-----");
        dbController.dadosProjetoFromLista(all_texts);
        dbController.printa_tudo();
        dbController.write();

        showDialog<String>(
          context: context,
          builder: (BuildContext context) => PopupUmaOpcao(
              title: "Sucesso",
              message: "Dados do projeto " + nome + " atualizados!",
              after_func: update_concluded),
        );
      }
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => PopupUmaOpcao(
            title: "Erro",
            message: "Impossível adicionar projeto sem informar seu nome!"),
      );
    }
  }

  void continua_write() {
    List all_lists = controller.get_all_controller_info();
    var dbController = dadosProjeto(nome: all_lists.first.first);
    dbController.dadosProjetoFromLista(all_lists);
    dbController.write();

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopupUmaOpcao(
          title: "Sucesso",
          message: all_lists.first.first + " adicionado(a) ao OrganizaPET!",
          after_func: register_concluded),
    );
  }

  void save_button_function() {
    createDB(controller.get_all_controller_info());
  }

  void register_concluded() {
    Navigator.popUntil(context, ModalRoute.withName('/lista_projetos'));
  }

  void update_concluded() {
    Navigator.pop(context);
    bool is_gerente =
        widget.dados.user.gerenciaProjetos.contains(widget.dados.nome);
    Navigator.pushReplacementNamed(context, "/visualizar_projeto",
        arguments: VisualizarProjetosArguments(
            widget.dados.nome, is_gerente, widget.dados.user));
  }
}

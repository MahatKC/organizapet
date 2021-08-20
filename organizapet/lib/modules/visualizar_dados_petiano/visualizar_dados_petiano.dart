import 'package:flutter/material.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petiano_arguments.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petianos_controller.dart';
import 'package:organizapet/modules/editar_dados_petiano/editar_petianos_db_controller.dart';
import 'package:organizapet/modules/menu/menu_sanduiche.dart';
import 'package:organizapet/modules/useful_functions/back_to_previous_screen.dart';
import 'package:organizapet/modules/visualizar_dados_petiano/visualizar_dados_arguments.dart';
import 'package:organizapet/shared/themes/app_colors.dart';
import 'package:organizapet/shared/themes/app_images.dart';
import 'package:organizapet/shared/widgets/app_bar/appBar.dart';
import 'package:organizapet/shared/widgets/icon_text_box/icon_text_box.dart';
import 'package:organizapet/shared/widgets/responsive_list/responsive_list.dart';
import 'package:organizapet/shared/widgets/single_double_button_selector/single_double_button_selector.dart';
import 'package:organizapet/shared/widgets/page_title/page_title.dart';
import 'package:organizapet/shared/widgets/popup/popup_duas_opcoes.dart';
import 'package:organizapet/shared/widgets/popup/popup_uma_opcao.dart';

class VisualizarDadosPetiano extends StatefulWidget {
  final VisualizarDadosArguments dados;

  const VisualizarDadosPetiano({required this.dados, Key? key})
      : super(key: key);

  @override
  _VisualizarDadosPetianoState createState() => _VisualizarDadosPetianoState();
}

class _VisualizarDadosPetianoState extends State<VisualizarDadosPetiano> {
  final controller = petianosController();
  bool access_db = true;
  late Future<void> start;

  @override
  void initState() {
    super.initState();
    start = read_db();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return back_to_previous_screen(context);
      },
      child: Scaffold(
          backgroundColor: AppColors.background,
          drawer: MenuSanduiche(user: widget.dados.user),
          appBar: AppBar(
            title: BarraApp(),
          ),
          body: FutureBuilder(
              future: start,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  final dbController = snapshot.data as dadosPetiano;
                  controller.instantiateAll(dbController);
                  return ResponsiveList(list: ListView(children: [
                          PageTitle(title: "Dados do Petiano"),
                          IconTextBox(
                            imagem: AppImages.usuario,
                            texto: controller.nomeController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.rg,
                            texto: controller.rgController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.cpf,
                            texto: controller.cpfController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.unioeste,
                            texto: controller.raController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.telefone,
                            texto: controller.telefoneController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.email,
                            texto: controller.emailController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.dataNascimento,
                            texto: controller.dataNascimentoController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.ano,
                            texto: controller.anoController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.icv,
                            texto: controller.temaICVController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.orientador,
                            texto: controller.orientadorController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.camiseta,
                            texto: controller.camisetaController.text,
                          ),
                          IconTextBox(
                            imagem: AppImages.github,
                            texto: controller.githubController.text,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: IconTextBox(
                              imagem: AppImages.insta,
                              texto: controller.instagramController.text,
                            ),
                          ),
                          enableButton(context),
                        ]),
                  
                    
                  );
                }
              })),
    );
  }

  Widget enableButton(BuildContext context) {
    if (widget.dados.user.isTutor == true) {
      return SingleDoubleButtonSelector(
        isDouble: true,
        tipoBotao1: 'bla',
        tipoBotao2: 'edit',
        callback1: delete_button,
        callback2: edit_button,
      );
    } else if (widget.dados.is_self == true) {
      return SingleDoubleButtonSelector(
          isDouble: false, tipoBotao1: 'edit', callback1: edit_button);
    } else {
      return Container();
    }
  }

  Future<dadosPetiano> read_db() async {
    var dbController = dadosPetiano(nome: widget.dados.nome);
    if (access_db == true && widget.dados.nome.isNotEmpty) {
      await dbController.read();
    }
    return dbController;
  }

  void eliminado() {
    String nome = controller.nomeController.text;
    if (nome.isNotEmpty) {
      final dbController = dadosPetiano(nome: nome);
      dbController.delete();
      Navigator.pop(context, 'sim');

      showDialog<String>(
        context: context,
        builder: (BuildContext context) => PopupUmaOpcao(
          title: "Sucesso",
          message: widget.dados.nome + " removido do OrganizaPET!",
          after_func: delete_concluded,
        ),
      );
    }
  }

  void delete_concluded() {
    Navigator.popUntil(context, ModalRoute.withName('/lista_petianos'));
  }

  void delete_button() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => PopupDuasOpcoes(
          title: "Atenção",
          message: "Deseja remover " + widget.dados.nome + "?",
          yes_callback: eliminado),
    );
  }

  void edit_button() {
    Navigator.pushReplacementNamed(context, "/editar_petiano",
        arguments: EditarPetianoArguments(
            nome: widget.dados.nome, user: widget.dados.user));
  }
}
